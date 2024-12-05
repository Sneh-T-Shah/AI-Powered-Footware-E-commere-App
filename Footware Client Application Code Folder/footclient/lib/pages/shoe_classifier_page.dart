import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tflite_flutter_plus/tflite_flutter_plus.dart';
import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';

void main() {
  runApp(ShoeClassifierApp());
}

class ShoeClassifierApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoe Classifier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  Interpreter? _interpreter;
  final List<String> _labels = ['Ballet Flat', 'Boat', 'Brogue', 'Clog', 'Sneaker'];
  String _result = 'Model not loaded';
  bool _isProcessing = false;
  double _confidence = 0.0;
  List<Map<String, dynamic>> _history = [];
  late int _inputWidth;
  late int _inputHeight;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('shoe_model.tflite');
      final inputShape = _interpreter!.getInputTensor(0).shape;
      _inputWidth = inputShape[2];
      _inputHeight = inputShape[1];
      setState(() {
        _result = 'Model loaded successfully';
      });
    } catch (e) {
      setState(() {
        _result = 'Failed to load the model: $e';
      });
    }
  }

  Future<void> _pickImage({required ImageSource source}) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _result = 'Image selected, processing...';
      });
      if (_interpreter != null) {
        await _runInference();
      } else {
        setState(() {
          _result = 'Model is not loaded yet. Please try again.';
        });
      }
    }
  }

  Future<void> _runInference() async {
    if (_image == null) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      img.Image image = img.decodeImage(_image!.readAsBytesSync())!;
      img.Image resizedImage = img.copyResize(image, width: _inputWidth, height: _inputHeight);

      TensorImage tensorImage = TensorImage(TfLiteType.float32);
      tensorImage.loadImage(resizedImage);

      ImageProcessor imageProcessor = ImageProcessorBuilder()
          .add(ResizeOp(_inputHeight, _inputWidth, ResizeMethod.nearestneighbour))
          .add(NormalizeOp(0, 255))
          .build();
      tensorImage = imageProcessor.process(tensorImage);

      TensorBuffer inputBuffer = TensorBuffer.createFixedSize(
          [1, _inputHeight, _inputWidth, 3], TfLiteType.float32);
      inputBuffer.loadBuffer(tensorImage.buffer);

      TensorBuffer outputBuffer = TensorBuffer.createFixedSize(
          [1, _labels.length], TfLiteType.float32);
      _interpreter!.run(inputBuffer.buffer, outputBuffer.buffer);

      List<double> scores = outputBuffer.getDoubleList();
      int maxIndex = scores.indexWhere((e) => e == scores.reduce(max));
      _confidence = scores[maxIndex] * 100;

      setState(() {
        _result = 'Predicted: ${_labels[maxIndex]} with confidence: ${_confidence.toStringAsFixed(2)}%';
        _saveToHistory(_image!, _labels[maxIndex], _confidence);
      });
    } catch (e) {
      setState(() {
        _result = 'Inference failed: $e';
      });
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  void _saveToHistory(File image, String category, double confidence) {
    if (_history.length >= 5) {
      _history.removeAt(0);
    }
    _history.add({
      'image': image,
      'category': category,
      'confidence': confidence,
    });
  }

  // Future<void> _saveImageToGallery() async {
  //   try {
  //     final directory = await getExternalStorageDirectory();
  //     if (directory == null) throw Exception("External storage directory not found");
  //     // final path = '${directory!.path}/ShoeClassifier';
  //     final path = '${directory.path}/ShoeClassifier';
  //     print("Saving image to: $path");
  //     final File file = await _image!.copy('$path/shoe_classification_${DateTime.now().millisecondsSinceEpoch}.png');
  //     final result = await ImageGallerySaver.saveFile(file.path);
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(result['isSuccess'] ? 'Image saved successfully!' : 'Failed to save image.')),
  //     );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to save image: $e')),
  //     );
  //   }
  // }




  Future<void> _saveImageToGallery(Uint8List bytes) async {
    try {
      final directory = await getApplicationDocumentsDirectory(); // Safer for Scoped Storage
      final filePath = '${directory.path}/shoe_${DateTime.now().millisecondsSinceEpoch}.png';

      final file = File(filePath);
      await file.writeAsBytes(bytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image saved successfully to $filePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save image: $e')),
      );
    }
  }

  Future<void> _shareResult() async {
    if (_image != null) {
      Share.share('Predicted Shoe Type: $_result with confidence: ${_confidence.toStringAsFixed(2)}%');
    }
  }

  void _showHistory() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: _history.length,
            itemBuilder: (context, index) {
              final item = _history[index];
              return ListTile(
                leading: Image.file(item['image'], width: 50, height: 50, fit: BoxFit.cover),
                title: Text('Predicted: ${item['category']}'),
                subtitle: Text('Confidence: ${item['confidence'].toStringAsFixed(2)}%'),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoe Classifier'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.history), onPressed: _showHistory),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Shoe Classifier',
                applicationVersion: '1.1.0',
                children: [Text('An AI-powered shoe classifier app.')],
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_image != null)
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.file(_image!, fit: BoxFit.cover),
                ),
              ),
            SizedBox(height: 20),
            Text(_result, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            if (_isProcessing) Center(child: CircularProgressIndicator()),
            SizedBox(height: 20),
            if (!_isProcessing)
              Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(source: ImageSource.gallery),
                    icon: Icon(Icons.image),
                    label: Text('Pick Image from Gallery'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(source: ImageSource.camera),
                    icon: Icon(Icons.camera_alt),
                    label: Text('Take a Picture'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    // onPressed: _saveImageToGallery,
                    onPressed: () async {
                      if (_image != null) {
                        final bytes = await _image!.readAsBytes();
                        await _saveImageToGallery(bytes);
                      }
                    },

                    icon: Icon(Icons.save),
                    label: Text('Save Image'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: _shareResult,
                    icon: Icon(Icons.share),
                    label: Text('Share Result'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

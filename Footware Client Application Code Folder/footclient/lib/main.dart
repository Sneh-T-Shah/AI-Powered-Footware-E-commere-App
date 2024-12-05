import 'package:flutter/material.dart';
import 'package:footclient/Controller/home_controller.dart';
import 'package:footclient/Controller/login_controller.dart';
import 'package:footclient/pages/login_page.dart';
import 'package:footclient/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC5CSR3DlxzhzEa8ywi_UsE6zyrOQGgpQs",
      appId: "1:228931085063:android:f0d808ce7932c05f9d9ba2",
      messagingSenderId: "228931085063",
      projectId: "footwareshop-8c9b5",
    ),
  );

  Get.put(LoginController());
  Get.put(HomeController());


  runApp(
    GetMaterialApp(
      home: LoginPage(),
      title: 'Footware Client App',
      debugShowCheckedModeBanner: false,
    ),
  );
}

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import '../model/user/user.dart';
import '../pages/home_page.dart';

class LoginController extends GetxController{

  GetStorage box=GetStorage();

   FirebaseFirestore firestore = FirebaseFirestore.instance;
   late CollectionReference userCollection;

   TextEditingController registerNameCtrl=TextEditingController();
   TextEditingController registerNumberCtrl=TextEditingController();
   TextEditingController registerPasswordCtrl=TextEditingController();

   TextEditingController loginNumber=TextEditingController();
   TextEditingController loginPassword=TextEditingController();

   // OtpFieldControllerV2 otpController = OtpFieldControllerV2();
   //
   // bool otpFieldShown= false;
   // int? otpSend;
   // int? otpEnter;


  User? loginUser;


   // @override
  // void onReady() {
  //   Map<String,dynamic>? user=box.read('loginUser');
  //   if(user!=null)
  //     {
  //       loginUser=User.fromJson(user);
  //       Get.to(()=>HomePage());
  //     }
  //   super.onReady();
  // }
   @override
  void onInit() {
    userCollection=firestore.collection('user');
    super.onInit();
  }

  Future<dynamic> addUser () async{
    try{
      /////////// Check if the user are before exist or not
      String name = registerNameCtrl.text;
      int? number = int.tryParse(registerNumberCtrl.text);
      // String password=registerPasswordCtrl.text;

      if (number == null && name.isEmpty) {

        Get.snackbar('Error', 'Please Fill All deatils', colorText: Colors.red);
        return;
      }

      // Check if user already exists
      QuerySnapshot querySnapshot = await userCollection
          .where('number', isEqualTo: number)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // User already exists
        Get.snackbar('Error', 'User already exists', colorText: Colors.red);
        return;
      }
      /////////// Check if the user are before exist or not end of the code

      // if(otpSend==otpEnter)
      // {

        // otpController.clear();
      DocumentReference doc=userCollection.doc();
      User user=User(
        id: doc.id,
        name: registerNameCtrl.text,
        number: int.tryParse(registerNumberCtrl.text),
        password: registerPasswordCtrl.text,
      );
      final userJson = user.toJson();
      await doc.set(userJson);
      Get.snackbar('Success','User Added Successfully',colorText: Colors.green);
      registerNameCtrl.clear();
      registerNumberCtrl.clear();
      registerPasswordCtrl.clear();
    }
    catch(e)
    {
      Get.snackbar('Error',e.toString(),colorText: Colors.red);
      print(e);
    }

  }


  // sendOtp() {
  //    try {
  //      if(registerNameCtrl.text.isEmpty || registerNumberCtrl.text.isEmpty)
  //      {
  //        Get.snackbar('Error','Please fill all the fields',colorText: Colors.red);
  //        return;
  //      }
  //
  //
  //
  //      final random = new Random();
  //      int otp= 1000 + random.nextInt(9000);
  //      print(otp);
  //      if(otp != null)
  //      {
  //
  //        otpFieldShown=true;
  //        otpSend=otp;
  //
  //        Get.snackbar('Success','OTP sent successfully',colorText: Colors.green);
  //      }else
  //        {
  //          Get.snackbar('Error','Something went wrong',colorText: Colors.red);
  //        }
  //    }catch (e) {
  //      Get.snackbar('Error',e.toString(),colorText: Colors.red);
  //    }
  //    finally{
  //      update();
  //    }
  // }




  Future<void> loginWithPhoneandPassword()  async {
    try{
      int? number = int.tryParse(loginNumber.text);
      // String password=loginPassword.text;

      if (number == null) {
        Get.snackbar('Error', 'Please enter a valid number', colorText: Colors.red);
        return;
      }

      QuerySnapshot querySnapshot = await userCollection
          .where('number', isEqualTo: number)
          // .where('password', isEqualTo: number)
          .get();

      if (querySnapshot.docs.isEmpty) {
        Get.snackbar('Error', 'User does not exist', colorText: Colors.red);
        return;
      }
      box.write('loginUser', querySnapshot.docs.first.data());
      loginNumber.clear();

      Get.to(HomePage());

      Get.snackbar('Success','Login Sucessful',colorText: Colors.green);
      loginNumber.clear();
    }catch(e){
      Get.snackbar('Error',e.toString(),colorText: Colors.red);
    }
}
}
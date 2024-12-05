import 'package:flutter/material.dart';
import 'package:footclient/Controller/login_controller.dart';
import 'package:footclient/pages/login_page.dart';
import 'package:get/get.dart';

import '../Widgets/otp_txt_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        // appBar: AppBar(
        //   title: Text('Create New account'),
        // ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Your Account',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  keyboardType: TextInputType.name,
                  controller: ctrl.registerNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter Your Name',
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Your Name',
                  )),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: ctrl.registerNumberCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: 'Enter your mobile number',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // OtpTextField(
              //   otpController: ctrl.otpController,
              //   isOtpVisible: ctrl.otpFieldShown,
                // onCompleted: (otp) {
                //   ctrl.otpEnter = int.tryParse(otp?? '0000');
                // },
              // ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: ctrl.registerPasswordCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password),
                  hintText: 'Enter your Password here',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    // if (ctrl.otpFieldShown) {
                      ctrl.addUser();
                    // } else {
                    //   ctrl.sendOtp();
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Register')),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute<void>(
                    builder: (BuildContext context) => LoginPage(),));
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      );
    });
  }
}

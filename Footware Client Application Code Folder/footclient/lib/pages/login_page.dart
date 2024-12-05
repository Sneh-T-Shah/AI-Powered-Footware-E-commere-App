import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:footclient/pages/register_page.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../Controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl)
    {
      return Scaffold(
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
                'Welcome Back!',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrl.loginNumber,
                keyboardType: TextInputType.phone,
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
              TextField(
                controller: ctrl.loginNumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password),
                  hintText: 'Enter your Password Here',
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  ctrl.loginWithPhoneandPassword();
                  ctrl.update();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white),
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ));
                },
                child: Text('Register new account'),
              ),
            ],
          ),
        ),
      );
    });
  }
}

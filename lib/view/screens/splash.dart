
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:files/consts/colors.dart';
import 'package:files/controller/auth_controller.dart';
import 'package:files/view/screens/login.dart';
import 'package:files/view/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';


class splash_screen extends StatelessWidget {
  
  
    var controller = Get.find<AuthController>();
    
            // if (controller1.TokenCustomer == null) {

  @override
  Widget build(BuildContext context) {
    
    return AnimatedSplashScreen(
      splash: Container(
        height:MediaQuery.of(context).size.height,
         width:MediaQuery.of(context).size.width,
       // decoration: gradientBackground,
        child: Column(
          children: [
           // SizedBox(height: 40,),
              Image.asset(
                      'assets/images/splash.png',
                      width:300,
                      height: 300,
                    ),
                    SizedBox(height: 0,),
                    Text(
                      "Welcome to the Files app! ",
                      style: TextStyle(
                           fontFamily:  'Caveat',
                          //fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: white,
                          decoration: TextDecoration.none),
                    ),
                     SizedBox(height: 0,),
                    Text(
                       "  Easily upload or download your files\n               with simplicity ",
                      style: TextStyle(
                           fontFamily:  'Caveat',
                          //fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: white,
                          decoration: TextDecoration.none),
                    ),
            //  Container(
            //           height: 200,
            //           width: 200,
            //           alignment: Alignment.centerLeft,
            //           decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               border: Border.all(width: 2, color: Colors.black),
            //               image: DecorationImage(
            //                   image: AssetImage('assets/images/ll.png')))),
          
            // TextUtils(
            //   fontSize: 18,
            //    fontWeight:FontWeight.bold,
            //     text: "WELCOME TO OUR EXHIBITION", 
            //     color: white,
            //      underLine: TextDecoration.none)
          ],
        ),
      ),
      
      backgroundColor:
      green,
      splashIconSize: 600,
      duration: 2500,
      splashTransition: SplashTransition.scaleTransition,
      centered: true,
      
      //  nextScreen: con_
      //troller.Token==null?Login(): MyApp());
      nextScreen:Login() );
  }
}
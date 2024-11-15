import 'package:files/consts/colors.dart';
import 'package:files/controller/auth_controller.dart';
import 'package:files/view/screens/widget/button.dart';
import 'package:files/view/screens/widget/custom_textfield.dart';
import 'package:files/view/screens/widget/text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
//

class Login extends StatelessWidget {
  var controller = Get.find<AuthController>();

  final RxBool _obscureText = true.obs;
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),

                SizedBox(
                  width: 150,
                ),
                // TextUtils(
                //     fontSize: 22,
                //     fontWeight: FontWeight.normal,
                //     text: 'LOGIN  ',
                //     color: green,
                //     underLine: TextDecoration.none),
                Text("Login ",
                      style: TextStyle(
                          fontFamily:  'Parisienne',
                          fontSize: 35,
                          color: black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),),

                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/login.png',
                  ),
                ),
               SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  hintText: 'Email',
                  obscureText: false,
                  prefixIcon: Icon(
                    Icons.email,
                    color: green,
                  ),
                  suffixIcon: Text(""),
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return 'Invalid email';
                    } else {
                      return null;
                    }
                  },
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.emailAddress,
                  onchange: (value) {
                    controller.email_log = value;
                    controller.validateEmail();
                  },
                ),

                SizedBox(
                  height: 30,
                ),
                Obx(
                  () => CustomTextField(
                    hintText: 'Password ',
                    prefixIcon: GestureDetector(
                        onTap: () {
                          _obscureText.toggle();
                          print(_obscureText
                              .value); // تبديل قيمة الـ RxBool بين true و false
                        },
                        child: Icon(
                          _obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _obscureText.value ? green : Colors.grey,
                        )),
                    obscureText: _obscureText.value,
                    suffixIcon: Text(""),

                    //const Icon(Icons.visibility, color: Colors.grey),

                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a password ';
                      }
                      if (value.toString().length < 6) {
                        return 'Password should be longer or equal to 6 characters';
                      } else {
                        return null;
                      }
                    },
                    hight: 60,
                    width: MediaQuery.of(context).size.width * 0.80,
                    keyboardType: TextInputType.text,
                    onchange: (value) {
                      controller.password_log = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  onPressed: ()async  {
                    //  print(controller.password);
                    if (fromKey.currentState!.validate()) {
                      controller.user=await controller.Login();
                      Get.offNamed('/home');
                    }
                  },
                  text: "Login",
                  hight: 50,
                  width: 200,
                ),
                // Button(
                //   onPressed: () async {
                //     // controller1.GetPartner();
                //     ProfileModel? p =
                //         await controller2.ShowProfile(controller.TokenCustomer);
                //     print(p!.id);
                //      print(p.nickName);
                //   },
                //   text: "Login",
                //   hight: 50,
                //   width: 200,
                // ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    // controller.localstorage.getString('token_customer');
                    // print("-----------${ controller.localstorage.getString('token_customer')}----");

                    Get.offNamed('/regester');
                  },
                  child: const Center(
                    child: Text(
                      "Don't have account? Click to create an account",
                      style: TextStyle(
                          fontFamily:  'OleoScript',
                          fontSize: 15,
                          color: black,
                          
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

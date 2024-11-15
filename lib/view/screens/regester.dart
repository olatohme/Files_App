import 'package:files/consts/colors.dart';
import 'package:files/controller/auth_controller.dart';
import 'package:files/view/screens/widget/button.dart';
import 'package:files/view/screens/widget/custom_textfield.dart';
import 'package:files/view/screens/widget/text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
//

class Regester extends StatelessWidget {
  var controller = Get.find<AuthController>();

  final RxBool _obscureText = true.obs;
  final RxBool _obscureText2 = true.obs;
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
                  height: 70,
                ),

                SizedBox(
                  width: 10,
                ),
                // TextUtils(
                //     fontSize: 22,
                //     fontWeight: FontWeight.bold,
                //     text: 'Regester ',
                //     color: green,
                //     underLine: TextDecoration.none),
                Text(
                  "Regester",
                  style: TextStyle(
                      fontFamily: 'Parisienne',
                      fontSize: 35,
                      color: black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),

                SizedBox(
                  height: 50,
                ),
                // Container(
                //   height: 200,
                //   width: 200,
                //   child: Image.asset(
                //     'assets/images/log.png',
                //   ),
                // ),
                CustomTextField(
                  hintText: 'Name ',
                  prefixIcon: Icon(Icons.person, color: green),
                  suffixIcon: Text(""),
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name';
                    }
                    if (!RegExp(validationName).hasMatch(value)) {
                      return 'Invalid name';
                    } else {
                      return null;
                    }
                  },
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.emailAddress,
                  onchange: (value) {
                    controller.name = value;
                  },
                ),
                SizedBox(
                  height: 20,
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
                    controller.email = value;
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
                      controller.password = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => CustomTextField(
                    hintText: 'Confirm Password',
                    prefixIcon: GestureDetector(
                        onTap: () {
                          _obscureText2.toggle();
                          print(_obscureText2
                              .value); // تبديل قيمة الـ RxBool بين true و false
                        },
                        child: Icon(
                          _obscureText2.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _obscureText2.value ? green : Colors.grey,
                        )),
                    obscureText: _obscureText2.value,
                    suffixIcon: Text(""),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a confirm password ';
                      }
                      if (value != controller.password) {
                        return 'The password and its confirmation are not the same';
                      } else {
                        return null;
                      }
                    },
                    hight: 60,
                    width: MediaQuery.of(context).size.width * 0.80,
                    keyboardType: TextInputType.text,
                    onchange: (value) {
                      controller.pass_confirm = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  onPressed: () async {
                    //  print(controller.password);
                    if (fromKey.currentState!.validate()) {
                      print("object");
                      controller.Regester();
                       Get.offNamed('/login');
                    }
                  },
                  text: "Sign in",
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

                    Get.offNamed('/login');
                  },
                  child: const Center(
                    child: Text(
                      "do you have an account? Click to log in",
                      style: TextStyle(
                          fontFamily: 'OleoScript',
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

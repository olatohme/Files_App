import 'package:files/consts/colors.dart';
import 'package:files/controller/auth_controller.dart';
import 'package:files/controller/file_controller.dart';
import 'package:files/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/user_file.dart';

class my_files extends StatelessWidget {
  // List<int> selectedCardIndices = [];
// class files extends StatelessWidget {
  var controller = Get.find<AuthController>();
  var controller1 = Get.find<AddFileController>();
  var controller2 = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    controller2.Statement();
    return SafeArea(
        child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              //
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/images/prof.png',
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        controller.user!.user.name,
                        style: TextStyle(
                            fontFamily: 'OleoScript',
                            fontSize: 15,
                            color: black,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        controller.user!.user.email,
                        style: TextStyle(
                            fontFamily: 'OleoScript',
                            fontSize: 15,
                            color: black,
                            decoration: TextDecoration.none),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                    ],
                  )
                ],
              )),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: GestureDetector(
            onTap: () async {
              await controller1.Bookfile();
              if (controller1.status_book == 201 ||
                  controller1.status_book == 200)
                controller1.isloading(!controller1.isloading.value);
              if (controller1.isloading.isTrue)
                controller1.isloading(!controller1.isloading.value);
            },
            child: Text(
              "Reseve Files",
              style: TextStyle(
                  fontFamily: 'OleoScript',
                  fontSize: 17,
                  color: Colors.red.shade800,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
        Obx(() {
          if (controller1.isloading.isTrue) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
          return Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: controller1.userfile!.the0.length,
                  itemBuilder: (context, index) {
                    return user_file(index);
                  }));
        })
      ]),
    ));
  }
}

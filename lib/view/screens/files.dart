import 'package:files/consts/colors.dart';
import 'package:files/controller/file_controller.dart';
import 'package:files/controller/auth_controller.dart';
import 'package:files/controller/home_controller.dart';
import 'package:files/view/screens/widget/button.dart';
import 'package:files/view/screens/widget/custom_textfield.dart';
import 'package:files/view/screens/widget/file_card.dart';
import 'package:files/view/screens/widget/text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

//
class files extends StatelessWidget {
  // List<int> selectedCardIndices = [];
// class files extends StatelessWidget {
  var controller = Get.find<AddFileController>();
  var controller2 = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    controller2.Statement();
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.zero,
                  border: Border(
                    bottom: BorderSide(color: white, width: 1),
                    left: BorderSide(color: white, width: 1),
                    right: BorderSide(color: white, width: 1),
                    top: BorderSide(color: white, width: 1),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  /// color: white,
                  //color: green,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green.shade300,
                      Colors.green.shade900,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.20,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60, 70, 0, 0),
                  child: Text(
                    "My Files",
                    style: TextStyle(
                        fontFamily: 'Caveat',
                        fontSize: 45,
                        color: black,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: InkWell(
                  onTap: () async {
                    await controller.pickFile();
                    if (controller.stats_add == 201 ||
                        controller.stats_add == 200)
                      controller.isloading(!controller.isloading.value);
                    if (controller.isloading.isTrue) {
                      controller.isloading(!controller.isloading.value);
                    }
                  },
                  child: Container(
                    height: 90,
                    width: 90,
                    child: Image.asset(
                      'assets/images/file1.png',
                    ),
                  ),
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.68,
                // color: green,

                decoration: BoxDecoration(
                  /// color: green,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.green.shade900,
                      Colors.green.shade300,
                    ],
                  ),
                  borderRadius: BorderRadius.zero,
                  //                border: Border(
                  //   bottom: BorderSide(color: green, width: 1),
                  //   left: BorderSide(color: green, width: 1),
                  //   right: BorderSide(color: green, width: 1),
                  //   top: BorderSide(color: green, width: 1),
                  // ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  /// color: white,

                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.68,
                child: Obx(() {
                  if (controller.isloading.isTrue) {
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
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: GestureDetector(
                            onTap: () async {
                              await controller.Bookfile();
                              if (controller.status_book == 201 ||
                                  controller.status_book == 200)
                                controller
                                    .isloading(!controller.isloading.value);
                              if (controller.isloading.isTrue)
                                controller
                                    .isloading(!controller.isloading.value);
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
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                            child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 10,
                                    ),
                                itemCount: controller.filemodel!.files.length,
                                itemBuilder: (context, index) {
                                  controller.isSelected.value = controller
                                      .selectedIndices
                                      .contains(index);
                                  return Card_file(index);
                                })),
                      ]);
                }),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

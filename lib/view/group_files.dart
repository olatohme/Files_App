import 'package:files/consts/colors.dart';
import 'package:files/controller/auth_controller.dart';
import 'package:files/controller/file_controller.dart';
import 'package:files/controller/groupdetails_controller.dart';
import 'package:files/controller/home_controller.dart';
import 'package:files/view/screens/widget/user_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class group_files extends StatelessWidget {
  // List<int> selectedCardIndices = [];
// class files extends StatelessWidget {
  var id = Get.arguments;
  groupdetailscontroller controller3 =
      Get.put<groupdetailscontroller>(groupdetailscontroller());
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
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.navigate_before),
                  iconSize: 40,
                  color: green,
                ),
                Container(
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
                    child: Row(children: [
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
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${controller3.groupdetails.members[id].name}',
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
                          '${controller3.groupdetails.members[id].email}',
                          style: TextStyle(
                              fontFamily: 'OleoScript',
                              fontSize: 15,
                              color: black,
                              decoration: TextDecoration.none),
                        ),
                      ])
                    ])),
              ],
            )),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: controller1.userfile!.the0.length,
                itemBuilder: (context, index) {
                  return user_file(index);
                })),
      ]),
    ));
  }
}

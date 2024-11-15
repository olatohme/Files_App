import 'dart:convert';

import 'package:files/controller/auth_controller.dart';
import 'package:files/controller/file_controller.dart';
import 'package:files/controller/groupcontroller.dart';
import 'package:files/model/grouo_model.dart';
import 'package:files/userinformation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '/consts/colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../url.dart';
import 'package:get/get.dart';

import '../../controller/groupdetails_controller.dart';
import '../../model/groupdetails_model.dart';

class detailsgroup extends StatelessWidget {
  groupdetailscontroller controller =
      Get.put<groupdetailscontroller>(groupdetailscontroller());
  groupcontroller controller4 = Get.put<groupcontroller>(groupcontroller());
  var controller2 = Get.find<AddFileController>();
  var controller1 = Get.find<AuthController>();
  late Data p = controller.groupdetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        actions: [
          PopupMenuButton(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  'join to group',
                  style: TextStyle(
                      fontFamily: 'OleoScript',
                      color: green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                value: 'joinn',
              ),
              PopupMenuItem(
                child: Text(
                  'delete',
                  style: TextStyle(
                      fontFamily: 'OleoScript',
                      color: green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                value: 'deletee',
              ),
              // PopupMenuItem(
              //   child: Text(
              //     'add file to group',
              //     style: TextStyle(
              //         color: green, fontSize: 15, fontWeight: FontWeight.bold),
              //   ),
              //   value: 'addfile',
              // ),
            ],
            onSelected: (val) async {
              if (val == 'deletee') {
                await deletegroup();
                Get.back();
                if (controller4.status_del == 201 ||
                    controller4.status_del == 200) {
                  controller4.isloading_grp(!controller4.isloading_grp.value);
                }
                if (controller4.isloading_grp.isTrue)
                  controller4.isloading_grp(!controller4.isloading_grp.value);
              }
              if (val == 'joinn') {
                jointogroup();
              }
              // if (val == 'addfile') {
              //   controller2.pickFile_group(
              //       url.idgroup, controller1.user!.user.id);
              // }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          //width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 40, top: 20),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 5),
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
                                'assets/images/group.png',
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              '${controller.groupdetails.name}',
                              style: TextStyle(
                                  fontFamily: 'OleoScript',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ]),
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Text(
                        'group members:',
                        style: TextStyle(
                            fontFamily: 'OleoScript',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SafeArea(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                controller2.userfile =
                                    await controller2.GetFiles_user(controller
                                        .groupdetails.members[index].id);
                                //   Navigator.push(context, new MaterialPageRoute(builder: (context)=>new
                                // memberdetails()));
                                Get.toNamed('/files_group', arguments: index);
                              },
                              child: Card(
                                color: Colors.white70,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 6,
                                margin: EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 17.0, left: 14),
                                      child: Container(
                                          height: 40,
                                          child: Text(
                                            '${controller.groupdetails.members[index].name}',
                                            style: TextStyle(
                                                fontFamily: 'OleoScript',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Colors.black),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 220,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: IconButton(
                                        onPressed: () {
                                          url.iduser = controller
                                              .groupdetails.members[index].id;

                                          print(url.iduser);
                                          deletemember();
                                        },
                                        color: green,
                                        icon: Icon(
                                          Icons.delete,
                                          color: green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: controller.groupdetails.members.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> jointogroup() async {
    var url3 = Uri.parse('${url.domain}/api/group/join-group/${url.idgroup}');
    print("${Userinformation.Token}");
    print(url3);
    var response = await http.get(
      url3,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Userinformation.Token}'
      },
    );
    print(response.body);
    print(response.statusCode);
  }

  Future<void> deletegroup() async {
    try {
      var url2 =
          Uri.parse('${url.domain}/api/group/Delete-Group/${url.idgroup}');
      print(url2);
      var response = await http.delete(
        url2,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Userinformation.Token}'
        },
      );
      print(response.body);
      print(response.statusCode);
      // print(response.body);
      // print(response.statusCode);
      var data = jsonDecode(response.body);
      controller4.status_del = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        controller4.isloading_grp(!controller4.isloading_grp.value);
        controller4.grouplist = await controller4.serves.getgroups('hg');
        print("get grop");
        EasyLoading.showSuccess(jsonDecode(response.body)['message']);

        print(response.statusCode);
        print("okkkkk del");
      } else {
        // print(token);
        print(response.statusCode);
        print("not okkk del");
        print(response.request);
        EasyLoading.showError(jsonDecode(response.body)['message']);
        //update();
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> addfiletogroup() async {
    var url = Uri.parse('');
    print(url);
    var response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearar ',
      },
    );
    print(response.body);
    print(response.statusCode);
  }

  Future<void> deletemember() async {
    try {
      var url2 = Uri.parse(
          '${url.domain}/api/group/remove-member/${url.idgroup}/${url.iduser}');
      print(url2);
      var response = await http.delete(
        url2,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Userinformation.Token}'
        },
      );
      print(response.body);
      print(response.statusCode);
      controller4.status_del = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = jsonDecode(response.body);
        controller4.isloading_grp(!controller4.isloading_grp.value);
        controller4.grouplist = await controller4.serves.getgroups('hg');
        EasyLoading.showSuccess("Group Deleted succecfull");
        if (controller4.status_del == 201 || controller4.status_del == 200)
          controller4.isloading_grp(!controller4.isloading_grp.value);
        print(response.statusCode);
        print("okkkkk del");
      } else {
        // print(token);
        print(response.statusCode);
        print("not okkk del");
        print(response.request);
        EasyLoading.showError(jsonDecode(response.body)['message']);
        //update();
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}

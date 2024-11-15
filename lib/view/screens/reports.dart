import 'package:files/consts/colors.dart';
import 'package:files/controller/reports_controller.dart';
import 'package:files/model/reports_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class reports extends StatelessWidget {
  reportscontroller controller =
      Get.put<reportscontroller>(reportscontroller());
  late List p = controller.reportslist;

  Widget buildlisttile(
      String title, IconData icon, void Function()? tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
              height: MediaQuery.of(context).size.height * 0.24,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(60, 70, 0, 0),
                child: Text(
                  "Reports",
                  style: TextStyle(
                      fontFamily: 'Caveat',
                      fontSize: 45,
                      color: black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.60,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      elevation: 6,
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 17.0, left: 0),
                            child: Container(
                              height: 130,
                              child: Column(
                                children: [
                                  Text(
                                    '${controller.reportslist[index].fileName}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${controller.reportslist[index].userName}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${controller.reportslist[index].eventType}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Date:    ' +
                                        '${controller.reportslist[index].eventDate.year}' +
                                        '/' +
                                        '${controller.reportslist[index].eventDate.month}' +
                                        '/' +
                                        '${controller.reportslist[index].eventDate.month}' +
                                        '${controller.reportslist[index].eventDate.day}' +
                                        '  '
                                            '${controller.reportslist[index].eventDate.hour}' +
                                        ':' +
                                        '${controller.reportslist[index].eventDate.minute}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: controller.reportslist.length,
              ),

              // }),

              /*   Drawer(

          child: Column(

            children: [
              Container(

                height: 120,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                color: Colors.cyanAccent,
                child: Text('PROIONTA ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                    color: Colors.black87),),


              ),

              SizedBox(height: 20),

              buildlisttile("LOGOUT", Icons.logout, (){}),
              buildlisttile("ADD_PRODUCT", Icons.add, (){}),



            ],

          ),
        ),*/
            ),
          ],
        ),
      ),
    );
  }
}

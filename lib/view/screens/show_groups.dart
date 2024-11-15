import 'package:files/consts/colors.dart';
import 'package:files/controller/groupdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/grouo_model.dart';
import 'group_details.dart';
import '../../controller/groupcontroller.dart';
import '../../url.dart';

class showgroup extends StatelessWidget {
  groupcontroller controller = Get.put<groupcontroller>(groupcontroller());
  groupdetailscontroller controller2 =
      Get.put<groupdetailscontroller>(groupdetailscontroller());
  late List p = controller.grouplist;
  int idgroup = 0;
  int id = 0;
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
                child: Row(
                  children: [
                    Text(
                      "Groups",
                      style: TextStyle(
                          fontFamily: 'Caveat',
                          fontSize: 45,
                          color: black,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.offNamed('/create');
                      },
                      icon: Icon(
                        Icons.add_circle_outlined,
                        color: white,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.60,
              child: Obx(() {
                if (controller.isloading_grp.isTrue) {
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
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        url.idgroup = controller.grouplist[index].id;
                        print(idgroup);
                        //
                        id = controller.grouplist[index].id;
                        controller2.groupdetails =
                            await controller2.serves.getdetailsgroups('hg', id);

                        Get.to(() => detailsgroup(), arguments: '${id}');

                        // Navigator.push(
                        //   context,
                        //   new MaterialPageRoute(
                        //       builder: (context) => new detailsgroup()),
                        // );
                      },
                      child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 5),
                          height: 70,
                          width: 100,
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
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                            child: Text(
                              '${controller.grouplist[index].name}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          )),
                    );
                  },
                  itemCount: controller.grouplist.length,
                );
              }),

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

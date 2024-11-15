import 'package:files/consts/colors.dart';
import 'package:files/controller/file_controller.dart';
import 'package:files/controller/groupcontroller.dart';
import 'package:files/model/files_model.dart';
import 'package:files/view/screens/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:files/url.dart';

class user_file extends StatefulWidget {
  int index = 0;
  int numberOfLines = 0;
  user_file(this.index);
  @override
  _CardListState createState() => _CardListState(this.index);
}

class _CardListState extends State<user_file> {
//class Card_file extends StatelessWidget {
  int index = 0;
  _CardListState(this.index);
  Color checkboxColor = Colors.grey;

  // FileElement file;
  // String extintion = "";
  var controller = Get.find<AddFileController>();
  GlobalKey _buttonKey = GlobalKey();
  groupcontroller controller1 = Get.put<groupcontroller>(groupcontroller());
  // Card_file(this.file) {
  // extintion = getFileExtension(this.file.name);
  //}
  String getFileExtension(String fileName) {
    int dotIndex = fileName.lastIndexOf('.');
    if (dotIndex != -1 && dotIndex < fileName.length - 1) {
      return fileName.substring(dotIndex + 1);
    }
    return ''; // إذا لم يكن هناك امتداد
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            if (controller.isSelected.value) {
              controller.selectedIndices
                  .remove(controller.userfile!.the0[index].id);
            } else {
              controller.selectedIndices
                  .add(controller.userfile!.the0[index].id);
            }
          });
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
          height: 80,
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
          child: Row(
            children: [
              Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: controller.selectedIndices
                      .contains(controller.userfile!.the0[index].id),
                  activeColor: Colors.red.shade800,
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        if (value) {
                          controller.selectedIndices
                              .add(controller.userfile!.the0[index].id);
                        } else {
                          controller.selectedIndices
                              .remove(controller.userfile!.the0[index].id);
                        }
                      }
                    });
                  }),
              Container(
                height: 30,
                width: 30,
                child: Image.asset(
                  'assets/images/fil.png',
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextUtils(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          text:
                              " this file is ${controller.userfile!.the0[index].status}",
                          color: Colors.black54,
                          underLine: TextDecoration.none),
                      // SizedBox(height: 20,),

                      //

                      //SizedBox(width: 20,),

                      Text(
                        "${controller.userfile!.the0[index].name}",
                        maxLines: 2, // عدد الأسطر المسموح بها قبل قطع النص
                        overflow: TextOverflow.ellipsis,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'OleoScript',
                            fontSize: 15,
                            color: Colors.black54,
                            decoration: TextDecoration.none),
                      )
                      // TextUtils(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.normal,
                      //     text: "${controller.filemodel!.files[index].name}",
                      //     color: Colors.black87,
                      //     underLine: TextDecoration.none),
                      // SizedBox(
                      //   width: 110,
                      // ),
                      // TextUtils(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.normal,
                      //     text: " 95 kB",
                      //     color: Colors.black54,
                      //     underLine: TextDecoration.none),
                      // SizedBox(
                      //   width: 30,
                      // ),
                    ]),
              ),

              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              //   child:
              IconButton(
                key: _buttonKey,
                onPressed: () async {
                  print('Selected Indices: ${controller.selectedIndices}');
                  // await controller.Bookfile();
                  final RenderBox renderBox = _buttonKey.currentContext!
                      .findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);

                  // Print the x and y coordinates

                  final buttonRect = Rect.fromPoints(
                    position,
                    Offset(position.dx + renderBox.size.width,
                        position.dy + renderBox.size.height),
                  );

                  showMenu(
                    context: context,
                    position: RelativeRect.fromRect(
                      buttonRect,
                      Offset.zero & MediaQuery.of(context).size,
                    ),
                    items: [
                      PopupMenuItem(
                        child: Text('Delete'),
                        value: 'Delete',
                      ),
                      PopupMenuItem(
                        child: Text('Update'),
                        value: 'Update',
                      ),
                      PopupMenuItem(
                        child: Text('Download'),
                        value: 'Download',
                      ),
                      PopupMenuItem(
                        child: Text('Add file to group'),
                        value: 'Add file to group',
                      ),
                    ],
                  ).then((value) async {
                    if (value == "Delete") {
                      // Handle the selected value
                      await controller.DeleteFile(
                          controller.userfile!.the0[index].id);
                      if (controller.status_del == 201 ||
                          controller.status_del == 200)
                        controller.isloading(!controller.isloading.value);
                      if (controller.isloading.isTrue)
                        controller.isloading(!controller.isloading.value);

                      print('Selected Action: delete');
                    } else if (value == "Update") {
                      controller
                          .pick_updateFile(controller.userfile!.the0[index].id);
                      if (controller.status_upd == 201 ||
                          controller.status_upd == 200)
                        controller.isloading(!controller.isloading.value);
                      // Handle the selected value

                      print('Selected Action: Update');
                    } else if (value == "Download") {
                      // Handle the selected value
                      controller.Downloadfile(
                          controller.userfile!.the0[index].id);
                      if (controller.status_down == 201 ||
                          controller.status_down == 200)
                        controller.isloading(!controller.isloading.value);
                      print('Selected Action: Download');
                    } else {
                      // Get.toNamed("/show_group");
                      controller1.grouplist =
                          await controller1.serves.getgroups('hg');
                      _showCardListDialog(
                          context, controller.userfile!.the0[index].id);
                    }
                  });
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
        ));
  }

  void _showCardListDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Groups"),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _buildCard(index, context, id);
              },
              itemCount: controller1.grouplist.length,
            ),
          ),
        );
      },
    );
  }

  // الدالة التي تبني بطاقة
  Widget _buildCard(int index, BuildContext context, int id) {
    return InkWell(
      onTap: () {
        url.idgroup = controller1.grouplist[index].id;
        print("id group ${url.idgroup}");
        print("id file ${id}");
        // print(idgroup);
        // //      Get.to(detailsgroup() ,arguments: idgroup);
        // Navigator.push(
        //   context,
        //   new MaterialPageRoute(builder: (context) => new detailsgroup()),
        // );
        controller.AddFile_togroup(id, url.idgroup);
        Navigator.of(context).pop();
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        elevation: 6,
        margin: EdgeInsets.all(15),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17.0, left: 14),
              child: Container(
                  height: 40,
                  child: Text(
                    '${controller1.grouplist[index].name}' +
                        '${controller1.grouplist[index].id}' +
                        ' v ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  )),
            ),
            //    SizedBox(width: 220,),
          ],
        ),
      ),
    );
  }
}

import 'package:files/consts/colors.dart';
import 'package:files/controller/home_controller.dart';
import 'package:files/view/screens/files.dart';
import 'package:files/view/screens/myfile.dart';
import 'package:files/view/screens/reports.dart';
import 'package:files/view/screens/show_groups.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            switch (controller.currentIndex.value) {
              case 0:
                return files();
              case 1:
                return my_files();
              case 2:
                return showgroup();
              case 3:
                return reports();
              default:
                return files();
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: green,
              ),
              label: 'files',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: green,
              ),
              label: 'profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.group_sharp,
                color: green,
              ),
              label: 'groups',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.report,
                color: green,
              ),
              label: 'reports',
            ),
          ],
        ),
      ),
    );
  }
}

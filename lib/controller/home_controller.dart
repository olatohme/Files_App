import 'package:files/controller/auth_controller.dart';
import 'package:files/controller/file_controller.dart';
import 'package:files/controller/groupcontroller.dart';
import 'package:files/controller/reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var controller = Get.find<AddFileController>();
  var controller1 = Get.find<AuthController>();
  groupcontroller controller2 = Get.put<groupcontroller>(groupcontroller());
  reportscontroller controller3 =
      Get.put<reportscontroller>(reportscontroller());
  var currentIndex = 0.obs;
  void Statement() async {
    switch (currentIndex.value) {
      case 0:
        controller.filemodel = await controller.GetFiles();
        controller.userfile =
            await controller.GetFiles_user(controller1.user!.user.id);
        if (controller.isloading.isTrue) {
          print(controller.isloading.value);
          controller.isloading(!controller.isloading.value);
          print(controller.isloading.value);
        }
        controller2.grouplist = await controller2.serves.getgroups('hg');
        if (controller2.isloading_grp.isTrue)
          controller2.isloading_grp(!controller2.isloading_grp.value);
        controller3.reportslist = await controller3.serves.getreports();
        break;
      case 1:
        controller.userfile =
            await controller.GetFiles_user(controller1.user!.user.id);
        break;

      default:
        break;
    }
  }
}

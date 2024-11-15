import 'package:files/controller/file_controller.dart';
import 'package:files/controller/home_controller.dart';
import 'package:files/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';
void main() {
   Get.put((AddFileController()));
   Get.put((AuthController()));
    Get.put((HomeController()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
 Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: AppRoutes.Home,
      getPages: AppRoutes.routes,
      builder: EasyLoading.init(),
      
    );
  }
}




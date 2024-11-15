import 'package:files/controller/file_controller.dart';
import 'package:files/controller/auth_controller.dart';
import 'package:files/view/screens/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFile extends StatelessWidget {
  AddFile({Key? key}) : super(key: key);
  var controller = Get.find<AddFileController>();
  var controller1 = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Container(
              height: 200,
              width: 200,
              child: Image.asset(
                'assets/images/file.png',
              ),
            ),
            SizedBox(height: 30),
            Button(
              onPressed: () async {
                //  print(controller.password);
                await controller.pickFile();
                 if (controller.isloading.isTrue) {
                 
                  controller.isloading(!controller.isloading.value);
                  
                }
              //  await  controller.AddFile();
              },
              text: "Add File",
              hight: 50,
              width: 200,
            ),

            SizedBox(height: 20),
            Button(
              onPressed: () async {
                //  print(controller.password);
                controller.filemodel = await controller.GetFiles();
                if (controller.isloading.isTrue) {
                   print(controller.isloading.value);
                  controller.isloading(!controller.isloading.value);
                  print(controller.isloading.value);
                }
               if(controller.status_get==200 ||controller.status_get==201)
                   Get.offNamed('/files');
              },
              text: "Get Files",
              hight: 50,
              width: 200,
            ),
            // Obx(() {
            //   if (controller.isLoading.value)
            //     return Center(child: CircularProgressIndicator());

            //   if (controller.fileToDisplay != null) {
            //     return Column(
            //       children: [
            //         //Image.file(controller.fileToDisplay!),
            //         SizedBox(height: 10),
            //         Text('Selected File: ${controller.filename}'),
            //       ],
            //     );
            //   } else {
            //     return Text('No file selected');
            //   }
            // }),
          ],
        ),
      ),
    );
  }
}

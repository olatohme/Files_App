import 'package:files/service/groupdetails_serves.dart';
import 'package:get/get.dart';

import '../model/groupdetails_model.dart';

class groupdetailscontroller extends GetxController {
  int id = 0;
  Data groupdetails = Data(
      id: 0,
      name: '',
      userId: 0,
      createdAt: DateTime(0, 0, 0),
      user: new User(email: '', name: '', id: 0),
      members: []);

  groupdetailsserves serves = groupdetailsserves();

  @override
  void onInit() {
    id = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() async {
    groupdetails = await serves.getdetailsgroups('hg',id);
//print(productlist[0].img_url);

    super.onReady();
  }
}

import 'package:files/model/grouo_model.dart';
import 'package:files/service/groupserves.dart';
import 'package:get/get.dart';

class groupcontroller extends GetxController {
  List<The0> grouplist = [];

  groupserves serves = groupserves();
  RxBool isloading_grp = true.obs;
  RxBool isloading_mem = true.obs;
  int status_cre = 0;
  int status_del= 0;
  int status_join= 0;
  int status_addmem = 0;
  int status_delmem = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    grouplist = await serves.getgroups('hg');
//print(productlist[0].img_url);

    super.onReady();
  }
}

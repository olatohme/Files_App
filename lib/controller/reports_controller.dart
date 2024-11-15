



import 'package:files/model/reports_model.dart';
import 'package:files/service/reports_serves.dart';
import 'package:get/get.dart';


class reportscontroller extends GetxController {
  List<Datum> reportslist = [];

  reportsserves serves = reportsserves();




  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    reportslist = await serves.getreports();
//print(productlist[0].img_url);


    super.onReady();
  }





}

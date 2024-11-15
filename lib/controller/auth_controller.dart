import 'dart:convert';
import 'package:files/model/user_model.dart';
import 'package:files/url.dart';
import 'package:files/view/storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../userinformation.dart';

class AuthController extends GetxController {
  // ProfileModel? profile;
  // ProfileModelPartner? prof;
  @override
  void onReady() async {
    // TODO: implement onReady
    // Securestorage storage = Securestorage();
    // Token = (await storage.read('token'));
    // print('token storage :${Token}');
    super.onReady();
  }
  @override
  void onInit() async {
    // Securestorage storage = Securestorage();
    // Token = (await storage.read('token')) ?? ''; 
    // print('token storage :${Token}');
    super.onInit();
  }
String? Token;
  //login partner
  var email_log = "";
  var password_log = "";
  int stats_log = 0;
  int stats_reg = 0;
  int stats_add = 0;
  var token = "";
  UserModel? user;
//regester
  var name = "";
  var email = "";
  var password = "";
  var pass_confirm = "";
  

  bool isVisibilty = false;
  bool isCheckBox = false;

  final RxBool isEmailValid = RxBool(false);
  void visibility() {
    isVisibilty = !isVisibilty;

    update();
  }

  void validateEmail() {
    if (GetUtils.isEmail(email)) {
      isEmailValid.value = true;
    } else {
      isEmailValid.value = false;
    }
  }

  Future<UserModel?> Login() async {
    try {
      print(Uri.https(Userinformation.domain, "/api/auth/login"));
      var response =
          await http.post(Uri.https(Userinformation.domain, "/api/auth/login"),
              // Uri.parse
              // ("${Userinformation.domain}/api/auth/login"),

              headers: {
            'Accept': 'application/json',
          }, body: {
        'email': email_log,
        'password': password_log
      });

      // var res = jsonDecode(response.body);

      //print(res);
      stats_log = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        var res = userModelFromJson(response.body);
        Userinformation.Token = res.accessToken;
        Userinformation.user_id = res.user.id;
        //   saveToken_partner(TokenPartner);
        Securestorage storage = Securestorage();
        storage.save('token', Userinformation.Token);
        //   print("$TokenPartner");
        EasyLoading.showSuccess("Successfull login !");
        print(response.statusCode);
        print("Successfull login !");
        return res;
      } else {
        EasyLoading.showError("Failed login ! ");
        //toast(context, res['message']);
        //  print(res['message']);
        print(response.statusCode);
        print("noooo");
      }
    } catch (e) {
      print("erroorr");
      print(e);
      EasyLoading.showError(e.toString());
    }
  }

  Future Regester() async {
    try {
      var response = await http.post(
          Uri.https(Userinformation.domain, "/api/auth/register"),
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'name': name,
            'email': email,
            'password': password,
            'password_confirmation': pass_confirm
          });

      var res = jsonDecode(response.body);
      print(res);
      stats_reg = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        EasyLoading.showSuccess("User successfully registered ");
        //token = res['token'];
        // saveToken_partner(TokenPartner);
        // Securestorage storage = Securestorage();
        // storage.save('p_token', TokenPartner!);
        // print("$TokenPartner");
        // print(response.statusCode);
        print("okkkkkk");
      } else {
        EasyLoading.showError(res['User failed registered']);
        //toast(context, res['message']);
        //print(res['message']);
        print(response.statusCode);
        print("noooo");
      }
    } catch (e) {
      print("erroorr");
      print(e);
      EasyLoading.showError(e.toString());
    }
  }
}

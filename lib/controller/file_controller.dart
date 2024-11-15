import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:files/model/files_model.dart';
import 'package:files/model/user_files_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../userinformation.dart';
import 'auth_controller.dart';

class AddFileController extends GetxController {
  List<int> selectedIndices = [];

  RxBool isSelected = false.obs;
  int stats_add = 0;
  int status_get = 0;
  int status_upd = 0;
  int status_down = 0;
  int status_del = 0;
  int status_book = 0;
  int status_get_user = 0;
  String numbersString = "";
  RxString filePath = ''.obs;
  FilePickerResult? result;
  String? filename;
  PlatformFile? pickedfile;
  RxBool isLoading1 = false.obs;
  File? fileToDisplay;
  FilesModel? filemodel;
  UserFilesModel? userfile;
  RxBool isloading = true.obs;
  String path_download = "";
  String url = "";
  String name_download = "";
  // var controller = Get.find<AuthController>();
  Future pickFile() async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result != null) {
        filename = result!.files.first.name;
        pickedfile = result!.files.first;
        // filePath.value = result!.files.first.path!;
        fileToDisplay = File(pickedfile!.path.toString());
        print("filename:$filename");

        await AddFile();

        // if (stats_add == 201 || stats_add == 200) isloading(!isloading.value);
      }

      isLoading1.value = false;
    } catch (e) {
      print("Error: $e");
    }
  }

  Future AddFile() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Userinformation.Token}'
      };

      var request = http.MultipartRequest(
        'POST',
        Uri.https(Userinformation.domain, "/api/storeFiles"),
      );

      request.files.add(await http.MultipartFile.fromPath(
          'file', fileToDisplay!.path.toString()));
      request.headers.addAll(headers);
      print("path is ${fileToDisplay!.path.toString()}");
      print("${Userinformation.Token} ");
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      stats_add = response.statusCode;
      print(response.statusCode);
      print(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = jsonDecode(responseBody);
        isloading(!isloading.value);
        filemodel = await GetFiles();
        EasyLoading.showSuccess("File Added succecfull");
        print(response.statusCode);
        print("okkkkk add");

        // filemodel = await GetFiles();
        // productList = await showprod();
        // print(isloading);
        // isloading(!isloading.value);
        // print(isloading);
      } else {
        // print(token);
        print(response.statusCode);
        print("not okkk add");
        print(response.request);
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        //update();
      }
    } catch (e) {
      print(e);
      EasyLoading.showError(e.toString());
    }
  }

  Future AddFile_togroup(int user_id, int group_id) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Userinformation.Token}'
      };
      var request = http.Request(
        'GET',
        Uri.https(Userinformation.domain,
            "/api/group/add-file/${group_id}/${user_id}"),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_get = response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("yesss addfile to");
        print(response.statusCode);

        var res = jsonDecode(responseBody);
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        // return res;
      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print("noo addfile to");
      }
    } catch (e) {
      print(e);
    }
  }

  void pick_updateFile(int id) async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result != null) {
        filename = result!.files.first.name;
        pickedfile = result!.files.first;
        // filePath.value = result!.files.first.path!;
        fileToDisplay = File(pickedfile!.path.toString());
        print("filename:$filename");
        await UpdateFile(id);
        if (status_upd == 201 || status_upd == 200) isloading(!isloading.value);
      }

      isLoading1.value = false;
    } catch (e) {
      print("Error: $e");
    }
  }
  // Future<void> uploadFile() async {
  //   if (filePath.isNotEmpty) {
  //     try {
  //       // Replace YOUR_UPLOAD_API_ENDPOINT with your actual upload endpoint
  //       var url = Uri.parse('YOUR_UPLOAD_API_ENDPOINT');
  //       var request = http.MultipartRequest('POST', url)
  //         ..files.add(await http.MultipartFile.fromPath('file', filePath.value));

  //       var response = await request.send();

  //       if (response.statusCode == 200) {
  //         print('File uploaded successfully');
  //       } else {
  //         print('File upload failed with status ${response.statusCode}');
  //       }
  //     } catch (error) {
  //       print('Error uploading file: $error');
  //     }
  //   } else {
  //     print('No file selected');
  //   }
  // }

  Future<FilesModel?> GetFiles() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Userinformation.Token}'
      };
      var request = http.Request(
        'GET',
        Uri.https(Userinformation.domain, "/api/files"),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_get = response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("yesss getfile");
        print(response.statusCode);

        var res = filesModelFromJson(responseBody);
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        return res;
      } else {
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print("noo getfile");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UserFilesModel?> GetFiles_user(int id) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $Userinformation.Token'
      };
      var request = http.Request(
        'GET',
        Uri.https(Userinformation.domain, "/api/get_files_user/${id}"),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_get_user = response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("yesss getfile_user");
        print(response.statusCode);

        var res = userFilesModelFromJson(responseBody);
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        return res;
      } else {
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print("noo getfile_user");
      }
    } catch (e) {
      print(e);
    }
  }

  Future Downloadfile(int id) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Userinformation.Token}'
      };
      var request = http.Request(
        'GET',
        Uri.https(Userinformation.domain, "/api/download/${id}"),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);
      print(res);
      status_down = response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        path_download = res['The path to download'];
        name_download = res['0'];
        // downloadFile();
        print("yesss download");
        print(response.statusCode);
        isloading(!isloading.value);
        filemodel = await GetFiles();

        // var res = filesModelFromJson(responseBody);
        // //  print("ooooooooooooooo");
        // // print(res);

        // //
        // //profile = res;
        // return res;
      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print("noo download ");
      }
    } catch (e) {
      print(e);
    }
  }

  Future UpdateFile(int id) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Userinformation.Token}'
      };

      var request = http.MultipartRequest(
        'POST',
        Uri.https(Userinformation.domain, "/api/update/${id}"),
      );

      request.files.add(await http.MultipartFile.fromPath(
          'file', fileToDisplay!.path.toString()));
      request.headers.addAll(headers);
      print("path is ${fileToDisplay!.path.toString()}");
      print("${Userinformation.Token} ");
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      stats_add = response.statusCode;
      print(response.statusCode);
      print(responseBody);
      status_upd = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = jsonDecode(responseBody);
        isloading(!isloading.value);
        filemodel = await GetFiles();
        // userfile = await GetFiles_user(controller.user!.user.id);

        print(response.statusCode);
        print("okkkkk update");

        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        // productList = await showprod();
        // print(isloading);
        // isloading(!isloading.value);
        // print(isloading);
      } else {
        // print(token);
        print(response.statusCode);
        print("not okkk update");
        print(response.request);
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        //update();
      }
    } catch (e) {
      print(e);
      // //EasyLoading.showError(e.toString());
    }
  }

  Future DeleteFile(int id) async {
    try {
      //  print("token is :$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Userinformation.Token}'
      };
      var request = http.Request(
        'DELETE',
        Uri.https(Userinformation.domain, "/api/destroy/${id}"),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);
      status_del = response.statusCode;
      // status_deleteoffer = response.statusCode;
      //json.decode(response.body);
      //jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
        isloading(!isloading.value);
        filemodel = await GetFiles();

        // controller1.isloading(!controller1.isloading.value);
        // controller2.prof = await controller2.ShowProfile_partner(token);
        // isloading(!isloading.value);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        print("yesss delete");
        print(response.statusCode);
        print(res);
        //  print(res[1].title);

      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        // isloading(!isloading.value);
        print("nooo delete");
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print("erroorr");
      EasyLoading.showError(e.toString());
    }
  }

  Future Bookfile() async {
    try {
      if (selectedIndices.length > 0) {
        numbersString = selectedIndices.join(', ');
        print("string is :${numbersString}");
      } else {
        print(' no files to reseve ');
      }
      // print("${selectedIndices}");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Userinformation.Token}'
      };
      var request = http.Request(
        'POST',
        Uri.https(Userinformation.domain, "/api/book"),
      );
      request.bodyFields = {'ids': "${numbersString}"};
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);
      print(res);
      status_book = response.statusCode;
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        isloading(!isloading.value);
        filemodel = await GetFiles();
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        print("okk book");
      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        print("not okkkk book ");
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  void downloadFile(int id) async {
    await Downloadfile(id);
    Dio dio = Dio();
    String path = "https://${Userinformation.domain}/${path_download}";
    // print(path);
    try {
      // إجراء طلب HTTP وتنزيل الملف
      Directory? externalDir = await getExternalStorageDirectory();
      String filesFolderPath = '${externalDir!.path}/files_download';

      // التأكد من وجود المجلد
      if (!(await Directory(filesFolderPath).exists())) {
        await Directory(filesFolderPath).create(recursive: true);
      }

      // الجمع بين المسار واسم الملف
      String filePath = '$filesFolderPath/${name_download}';

      await dio.download(path, filePath);
      EasyLoading.showSuccess("File Downloaded succecfull in :$filePath ");
      isloading(!isloading.value);
      print('تم تنزيل الملف بنجاح إلى: $filePath');
    } catch (error) {
      print('حدث خطأ أثناء تنزيل الملف: $error');
      isloading(!isloading.value);
    }
  }
}

import 'package:files/view/group_files.dart';
import 'package:files/view/screens/addfile.dart';
import 'package:files/view/screens/create_group.dart';
import 'package:files/view/screens/files.dart';
import 'package:files/view/screens/group_details.dart';
import 'package:files/view/screens/home.dart';
import 'package:files/view/screens/login.dart';
import 'package:files/view/screens/myfile.dart';
import 'package:files/view/screens/regester.dart';
import 'package:files/view/screens/show_groups.dart';
import 'package:files/view/screens/splash.dart';
import 'package:get/get.dart';

class AppRoutes {
  //initialRoute

  static const Home = '/splash';

  //getPages

  static final routes = [
    GetPage(name: '/addfile', page: () => AddFile()),
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/regester', page: () => Regester()),
    GetPage(name: '/files', page: () => files()),
    GetPage(name: '/home', page: () => MyApp()),
    GetPage(name: '/create', page: () => create_group()),
    GetPage(name: '/files_user', page: () => my_files()),
    GetPage(name: '/files_group', page: () => group_files()),
    GetPage(name: '/show_group', page: () => showgroup()),
    GetPage(name: '/splash', page: () => splash_screen()),
     GetPage(name: '/groupdetails', page: () => detailsgroup()),
    

  ];
}

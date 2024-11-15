import 'package:flutter/material.dart';

const PrimaryColor = const Color(0XFFb39ddb);
const kPrimaryColor = const Color(0XFF6A62B7);
const kBackgroundColor = Color(0XFFE5E5E5);
Color green = Colors.green.shade900;
Color primary1 = Colors.deepPurple.shade50;
const primary2 = Color(0Xff873bcc);
const primary3 = Color(0XffB39DDc);
Color colorprimary = Color.fromRGBO(122, 101, 138, 1);
//Color kPrimaryColor=Color.fromRGBO(122, 101, 138, 1);
//c=Colors.

Color firstBackgroundColor = kPrimaryColor.withOpacity(0.4);
const Color secondBackgroundColor = Color(0xff172CA1);
const Color thirdBackgroundColor = Color(0xff556AEF);
const Color dividerColor = Color(0xff485CDF);
const Color black = Color(0xff000000);
const Color black2 = Colors.black45;
const Color black3 = Colors.black26;
const Color white = Color(0xffffffff);
const Color mainFontColor = Color(0xff4E62E6);
const Color yellow = Color(0xffFDEA03);
Color r = Colors.purpleAccent.withOpacity(0.4);
String validationEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

String validationName = r'^[a-z A-Z]+$';
String validationPhone =
    r'^\+?(\d{1,3})?[-.\s]?(\d{3})[-.\s]?(\d{3})[-.\s]?(\d{4})$';

void toast(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    // width: MediaQuery.of(context).size.width*0.80,
    duration: Duration(seconds: 5),
    backgroundColor: kPrimaryColor,
    // margin: EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
  ));
}

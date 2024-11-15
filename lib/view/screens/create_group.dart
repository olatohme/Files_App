import 'package:files/consts/colors.dart';
import 'package:files/controller/groupcontroller.dart';
import 'package:files/controller/groupdetails_controller.dart';
import 'package:files/userinformation.dart';
import 'package:files/view/screens/show_groups.dart';
import 'package:files/view/screens/widget/button.dart';
import 'package:files/view/screens/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../url.dart';
import 'dart:io';
import 'dart:convert';

class create_group extends StatelessWidget {
  create_group({Key? key}) : super(key: key);

  var name = '';
  groupcontroller controller2 = Get.put<groupcontroller>(groupcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 130,
            ),
            SizedBox(
              height: 50,
            ),
            const Text(
              'if you want to crate a group \n              add its name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 100,
            ),
            /*  Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(30),
          ),
          child: Center(
            child: TextFormField(

              onChanged:(value){
name=value;
              },


              keyboardType:  TextInputType.text,
              decoration: InputDecoration(
                hintText: 'enter the name of your group',

                hintStyle: TextStyle(fontSize: 20,color: Colors.black38),
                contentPadding: EdgeInsets.only(left: 12,right: 12,bottom: 6,top: 12),
                prefixIcon: IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.favorite,
                    color:Colors.red,


                  ),
                ),
              ),

              style: TextStyle(color: Colors.black),

            ),
          ),
        ),*/
            CustomTextField(
              hintText: 'Name ',
              obscureText: false,
              prefixIcon: Icon(
                Icons.group,
                color: green,
              ),
              suffixIcon: Text(""),
              validator: (value) {
                if (!RegExp(validationEmail).hasMatch(value)) {
                  return 'Invalid name';
                } else {
                  return null;
                }
              },
              hight: 60,
              width: MediaQuery.of(context).size.width * 0.80,
              keyboardType: TextInputType.text,
              onchange: (value) {
                name = value;
              },
            ),
            SizedBox(
              height: 50,
            ),
            Button(
              onPressed: () {
                creategroup();

                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new showgroup()));

                if (controller2.isloading_grp.isTrue)
                  controller2.isloading_grp(!controller2.isloading_grp.value);
              },
              text: "Add Group",
              hight: 50,
              width: 200,
            ),
            /* RaisedButton(
                onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new
                  showgroup()));
              //   creategroup();
                 print("ff");
                },
              color: Colors.white24,
              child: Text('Add',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
            )*/
          ],
        ),
      ),
    );
  }

  var url1 = Uri.parse('${url.domain}/api/group/store');

  Future<void> creategroup() async {
    try {
      var response = await http.post(
        url1,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Userinformation.Token}'
        },
        body: {
          'name': name,
        },
      );

      print(url1);
      print(response.statusCode);
      print(response.body);
      controller2.status_cre = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = jsonDecode(response.body);
        controller2.isloading_grp(!controller2.isloading_grp.value);
        controller2.grouplist = await controller2.serves.getgroups('hg');
        EasyLoading.showSuccess("Group Added succecfull");
        if (controller2.status_cre == 201 || controller2.status_cre == 200)
          controller2.isloading_grp(!controller2.isloading_grp.value);
        print(response.statusCode);
        print("okkkkk add");
      } else {
        // print(token);
        print(response.statusCode);
        print("not okkk add");
        print(response.request);
        EasyLoading.showError(jsonDecode(response.body)['message']);
        //update();
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
    print(name);
  }
}

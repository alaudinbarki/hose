import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/controllers/auth_controller.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  final DocumentSnapshot? document;
  bool? edit;
  EditProfile({Key? key, this.document, this.edit}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var nameController = TextEditingController();
  var number = TextEditingController();
  var email = TextEditingController();
  var groupValue = -1;

  @override
  void initState() {
    nameController.text = widget.document!['name'].toString();
    number.text = widget.document!['phone'].toString();
    email.text = widget.document!['email'].toString();
    if (widget.document!['gender'] == 'male') {
      groupValue = 1;
    } else {
      groupValue = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      controller: nameController,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        labelText: 'الاسم بالكامل',
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      controller: number,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        labelText: "رقم الجـوال",
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      controller: email,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(labelText: "البريد الالكتروني"),
                    ),
                  ),
                ],
              ),
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [radioButtons(0, "انثى"), radioButtons(1, "ذكر")],
            ),
            10.heightBox,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5.0,
                shadowColor: Colors.cyanAccent,
                primary: Colors.white,
              ),
              onPressed: () async {
                final controller = Get.put(AuthController());
                await controller.updateUser(email: email.text, gender: groupValue == 0 ? 'female' : 'male', name: nameController.text, phone: number.text);
                VxToast.show(context, msg: "Profile Updated");

                print("done");
              },
              child: "تحديث المعلومات".text.color(Color(0xff28476E)).size(18).make(),
            )
          ],
        ),
      ),
    );
  }

  Widget radioButtons(int value, String title) {
    return Column(
      children: [
        title.text.make(),
        5.heightBox,
        Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (int? newValue) {
              setState(() {
                groupValue = newValue!;
              });
            })
      ],
    );
  }
}

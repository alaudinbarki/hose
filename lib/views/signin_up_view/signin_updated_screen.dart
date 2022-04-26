import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/consts.dart';
import 'package:hoseapp/consts/importer.dart';
import 'package:hoseapp/controllers/auth_controller.dart';
import 'package:hoseapp/views/home_view/home_main.dart';
import 'package:hoseapp/views/signin_up_view/components/verifynumber.dart';

class SignInScreenUpdated extends StatefulWidget {


  @override
  State<SignInScreenUpdated> createState() => _SignInScreenUpdatedState();
}

class _SignInScreenUpdatedState extends State<SignInScreenUpdated> {
  final controller = Get.put(AuthController());
  var formKey = GlobalKey<FormState>();
  TextEditingController phoneEdtingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.png'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,),
              SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        language == 'english' ? 'Sign in' : 'تسجيل الدخول',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        shadowColor: Colors.black54,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Form(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter phone number";
                                      }
                                      return null;
                                    },
                                    controller: phoneEdtingController,
                                    decoration: InputDecoration(hintText: '05xxxxxxx', border: InputBorder.none, contentPadding: EdgeInsets.only(left: 18)),
                                  ),
                                ),
                              ),
                              Text(
                                language == 'english' ? 'Mobile Number' : 'رقم الجوال',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Center(
                                child: Image(
                                  image: AssetImage('assets/NoPath - Copy (2).png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                          onTap: () async {
                            ()=> Get.to(VerifyNumber());
                            // if (formKey.currentState!.validate()) {
                            //   var p = phoneEdtingController.text;
                            //   controller.signin(p, passEditingController.text).then((credential) {
                            //     if (credential != null) {
                            //       VxToast.show(context, msg: "Logged in successfully");
                            //       Get.offAll(() => VerifyNumber());
                            //     } else {
                            //       VxToast.show(context, msg: controller.error);
                            //     }
                            //   });
                            // }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            decoration:
                            BoxDecoration(border: Border.all(color: Color(0xff35DDDE)), borderRadius: BorderRadius.circular(10), color: Color(0xff28476E)),
                            child: Center(
                              child: Text(
                                language == 'english' ? 'Login' : 'دخول',
                                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      SizedBox(height: 70,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

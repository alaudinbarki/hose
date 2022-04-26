import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/consts.dart';

import 'package:hoseapp/consts/importer.dart';
import 'package:hoseapp/controllers/auth_controller.dart';
import 'package:hoseapp/views/home_view/welcome_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final controller = Get.find<AuthController>();
  bool isMale = false;
  final formKey = GlobalKey<FormState>();

  var firstNameEditingController = TextEditingController();
  var lastNameEditingController = TextEditingController();
  var usernameEditingController = TextEditingController();
  var emailEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();
  var phoneEditingController = TextEditingController();
  var gender = 'male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/background.png'), fit: BoxFit.cover),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(30)),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    language == 'english' ? 'New User' : 'مستخدم جديد',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 30,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xff28476E),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter last name";
                                  }
                                  return null;
                                },
                                controller: lastNameEditingController,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  hintText: language == 'english' ? 'Last name' : 'الاسم الاخير',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff28476E),
                                  ),
                                  border: InputBorder.none,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xff28476E),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter first name";
                                  }
                                  return null;
                                },
                                controller: firstNameEditingController,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  hintText: language == 'english' ? 'Forename' : 'الاسم الأول',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff28476E),
                                  ),
                                  border: InputBorder.none,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 130, top: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff28476E),
                          width: 1,
                        ),
                      ),
                    ),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter user name";
                          }
                          return null;
                        },
                        controller: usernameEditingController,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: language == 'english' ? 'Username' : 'اسم المستخدم',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xff28476E),
                          ),
                          border: InputBorder.none,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40, top: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff28476E),
                          width: 1,
                        ),
                      ),
                    ),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter email";
                          }
                          return null;
                        },
                        controller: emailEditingController,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: language == 'english' ? 'Email' : 'الايميل',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xff28476E),
                          ),
                          border: InputBorder.none,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 130, top: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff28476E),
                          width: 1,
                        ),
                      ),
                    ),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter password";
                          }
                          return null;
                        },
                        controller: passwordEditingController,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: language == 'english' ? 'Password' : 'كلمة السر',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xff28476E),
                          ),
                          border: InputBorder.none,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40, top: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff28476E),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text('+966'),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter phone number";
                              }
                              return null;
                            },
                            controller: phoneEditingController,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: language == 'english' ? 'Phone number' : 'رقم الهاتف',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Color(0xff28476E),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff28476E),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isMale = !isMale;
                              gender = "female";
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Center(
                              child: Text(
                                language == 'english' ? 'Female' : 'انثى',
                                style: TextStyle(
                                    color: isMale == false ? Color(0xff28476E) : Colors.blue, fontWeight: FontWeight.w600, fontFamily: 'JF Flat', fontSize: 13),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: VerticalDivider(
                            width: 30,
                            thickness: 2,
                            color: Color(0xff28476E),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = !isMale;
                              gender = 'male';
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 20),
                            child: Center(
                              child: Text(
                                language == 'english' ? 'Male' : 'ذكر',
                                style: TextStyle(
                                    color: isMale == true ? Color(0xff28476E) : Colors.blue, fontWeight: FontWeight.w600, fontFamily: 'JF Flat', fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              var email = "+966${phoneEditingController.text}@gmail.com";
                              var name = "${firstNameEditingController.text} ${lastNameEditingController.text}";
                              controller
                                  .signup(email: email, password: passwordEditingController.text)
                                  .then((value) => controller.storeUserData(
                                      email: emailEditingController.text,
                                      gender: gender,
                                      name: name,
                                      password: passwordEditingController.text,
                                      phone: phoneEditingController.text,
                                      username: usernameEditingController.text))
                                  .then((value) {
                                Get.to(() => WelcomeScreen());
                              });
                              VxToast.show(context, msg: "Registration completed");
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50.0,
                            decoration:
                                BoxDecoration(border: Border.all(color: Color(0xff35DDDE)), borderRadius: BorderRadius.circular(10), color: Color(0xff28476E)),
                            child: Center(
                              child: Text(
                                language == 'english' ? 'Sign up' : 'تسجيل',
                                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

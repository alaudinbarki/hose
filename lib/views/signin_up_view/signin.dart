import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/consts.dart';
import 'package:hoseapp/consts/importer.dart';
import 'package:hoseapp/controllers/auth_controller.dart';
import 'package:hoseapp/views/home_view/home_main.dart';
import 'package:hoseapp/views/signin_up_view/components/forgotpassword.dart';
import 'package:hoseapp/views/signin_up_view/signup.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    language == 'english' ? 'Sign in' : 'تسجيل الدخول',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 30,
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
                    height: 10,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black54,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: formKey,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter password";
                                  }
                                  return null;
                                },
                                controller: passEditingController,
                                obscureText: true,
                                decoration: InputDecoration(hintText: '06xxxxxxx', border: InputBorder.none, contentPadding: EdgeInsets.only(left: 20)),
                              ),
                            ),
                          ),
                          Text(
                            language == 'english' ? 'Password' : 'كلمة المرور',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Center(
                            child: Image(
                              image: AssetImage('assets/NoPath - Copy (4).png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => SignUpScreen());
                            },
                            child: Text(
                              language == 'english' ? 'Don\'t have an account? Participation' : 'ليس لديك حساب ؟ اشتراك',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => ForgotPassword());
                            },
                            child: Text(
                              language == 'english' ? 'Set password?' : 'سيت كلمة المرور؟',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => SignUpScreen());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            decoration:
                                BoxDecoration(border: Border.all(color: Color(0xff35DDDE)), borderRadius: BorderRadius.circular(10), color: Color(0xff28476E)),
                            child: Center(
                              child: Text(
                                language == 'english' ? 'Sign up' : 'اشتراك',
                                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                var p = phoneEdtingController.text + '@gmail.com';
                                controller.signin(p, passEditingController.text).then((credential) {
                                  if (credential != null) {
                                    VxToast.show(context, msg: "Logged in successfully");
                                    Get.offAll(() => HomeMain());
                                  } else {
                                    VxToast.show(context, msg: controller.error);
                                  }
                                });
                              }
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    language == 'english' ? 'Or' : 'أو',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(
                        0xff28476E,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

                      if (!isIOS) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("For iOS only"),
                            duration: Duration(milliseconds: 300),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("IOS"),
                            duration: Duration(milliseconds: 300),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/black-apple-icon.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            language == 'english' ? 'Login as Apple' : 'Apple المتابعة مع',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () async {
                        await controller.googleSignin().then((value) {
                          VxToast.show(context, msg: "Logged in successfully");
                          Get.offAll(() => HomeMain());
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/google.png'),
                                height: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                language == 'english' ? 'Login as Google' : 'Google  المتابعة مع',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ))),
                ],
              ),
            ),
          ),
        )),
    );
  }
}

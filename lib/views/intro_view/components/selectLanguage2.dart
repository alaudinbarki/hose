import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/consts.dart';
import 'package:hoseapp/views/signin_up_view/signin.dart';
import 'package:hoseapp/views/signin_up_view/signin_screen.dart';
import 'package:hoseapp/views/signin_up_view/signin_updated_screen.dart';

class SelectLanguage2 extends StatefulWidget {
  @override
  _SelectLanguage2State createState() => _SelectLanguage2State();
}

class _SelectLanguage2State extends State<SelectLanguage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.only(top: 220),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'اختار اللغة',
                            style: TextStyle(color: Color(0xff28476E), fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * .5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              language = 'english';
                              Get.to(() => Sign_In_Screen());
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'UK',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/uk_flag.png'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              language = 'arabic';
                              Get.to(() => SignInScreenUpdated());
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'عربي',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [Image.asset('assets/saudia_flag.png')],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}

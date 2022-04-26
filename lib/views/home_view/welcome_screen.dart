import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/views/home_view/home_main.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'اهلا وسهلا بك',
                    style: TextStyle(color: Color(0xff28476E), fontWeight: FontWeight.bold, fontSize: 30),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 220),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'انقر للبداية',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff28476E)),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => HomeMain());
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('assets/tap.png')],
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}

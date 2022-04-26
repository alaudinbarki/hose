import 'package:flutter/material.dart';

class ReLogin extends StatefulWidget {
  @override
  _ReLoginState createState() => _ReLoginState();
}

class _ReLoginState extends State<ReLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/back_icon.png'),
                ],
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('إعادة تسجيل الدخول',style: TextStyle(color: Color(0xff28476E),fontWeight: FontWeight.bold,fontSize: 25),)
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 80,right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*.7,
                    child: TextField(
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        hintText: ' اسم  المستخدم ',
                        hintStyle: TextStyle(color: Color(0xff28476E),fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff28476E)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 30,right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*.7,
                    child: TextField(
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        hintText: 'كلمة السر ',
                        hintStyle: TextStyle(color: Color(0xff28476E),fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff28476E)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(top: 20,right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('هل نسيت كلمة السر ؟',style: TextStyle(color: Color(0xff28476E),fontWeight: FontWeight.bold),)
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 150),
              width: MediaQuery.of(context).size.width*.5,
              height: MediaQuery.of(context).size.height*.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('استمرار',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),

                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xff28476E),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.fill
          )
        ),
      ),
    );
  }
}

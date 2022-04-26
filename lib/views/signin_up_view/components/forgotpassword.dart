import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        child: Column(
          children: [
            
            Container(
              margin: EdgeInsets.only(top: 40,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/back_icon.png'),
                ],
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(right: 20,top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('هل نسيت كلمة السر',style: TextStyle(color: Color(0xff28476E),fontWeight: FontWeight.bold,fontSize: 28),),
                ],
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(right: 20,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('_____________________________________________',style: TextStyle(color: Color(0xff28476E),fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(top: 20,right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text('أدخل رقم هاتفك أدناه وسنرسل إليك رسالة نصية',style: TextStyle(color: Color(0xff28476E),fontWeight: FontWeight.bold,fontSize: 18),)
                    ],
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text('تحتوي على رمز التحقق لتغيير كلمة المرور',style: TextStyle(color: Color(0xff28476E),fontWeight: FontWeight.bold,fontSize: 18),)
                    ],
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text('الخاصة بك',style: TextStyle(color: Color(0xff28476E),fontWeight: FontWeight.bold,fontSize: 18),)
                    ],
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 80,right: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*.7,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'رقم الهاتف',
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
              margin: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width*.5,
              height: MediaQuery.of(context).size.height*.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ارسال',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),

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
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}

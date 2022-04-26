import 'package:flutter/material.dart';
import 'package:hoseapp/consts/consts.dart';

Widget fixedScreen() {
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Transform.scale(
                      scale: 1.10,
                      child: Switch(
                        onChanged: (value) {},
                        value: false,
                        activeColor: Colors.white,
                        activeTrackColor: Colors.blue,
                        inactiveThumbColor: Color(0xff28476E),
                        inactiveTrackColor: Colors.grey,
                      )),
                ],
              ),
              Row(
                children: [
                  Text(
                    language == 'english' ? 'Notifications  ' : "الاشعارات  ",
                    style: TextStyle(fontSize: 15, fontFamily: 'JF Flat'),
                  ),
                  Image.asset('assets/Group 75.png')
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff35DDDE),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // whatsAppLaunch();
                },
                child: Row(
                  children: [
                    Text(
                      language == 'english' ? 'Technical support  ' : "الدعم الفني  ",
                      style: TextStyle(fontSize: 15, fontFamily: 'JF Flat'),
                    ),
                    Image.asset('assets/NoPath - Copy (42).png')
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),

          ///terms and conditions row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff35DDDE),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    language == 'english' ? 'Terms and Conditions  ' : "الشروط والاحكام  ",
                    style: TextStyle(fontSize: 15, fontFamily: 'JF Flat'),
                  ),
                  Image.asset('assets/NoPath - Copy (35).png')
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 15,
          ),

          SizedBox(
            height: 25.0,
          ),
        ],
      ),
    ),
  );
}

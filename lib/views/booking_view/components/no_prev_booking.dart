import 'package:flutter/material.dart';

Widget noPrevBooking() {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Image.asset('assets/largeClock.png'),
          SizedBox(
            height: 30,
          ),
          Text(
            'لاتوجد أي حجوزات سابقة',
            style: TextStyle(color: Color(0xff28476E), fontSize: 18),
          )
        ],
      ),
    ),
  );
}

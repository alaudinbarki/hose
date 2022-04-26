import 'package:flutter/material.dart';

Widget rates(document, title, value) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 12),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: Color(0xff35DDDE),
          offset: Offset(1, 1),
          spreadRadius: 2,
        )
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${document!['$value']} ريال",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}

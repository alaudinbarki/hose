import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/importer.dart';

Widget exitDialog() {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          "تؤكد".text.semiBold.size(18).make(),
          const Divider(),
          5.heightBox,
          "هل أنت متأكد من انك تريد الخروج؟".text.size(16).make(),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xff28476E), padding: EdgeInsets.all(8.0)),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: "نعم".text.size(16).make()),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xff28476E), padding: EdgeInsets.all(8.0)),
                  onPressed: () {
                    Get.back();
                  },
                  child: "لا".text.size(16).make()),
            ],
          )
        ],
      ).box.white.roundedSM.make(),
    ),
  );
}

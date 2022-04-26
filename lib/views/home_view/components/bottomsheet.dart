import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/consts.dart';
import 'package:hoseapp/controllers/home_controller.dart';
import 'package:hoseapp/views/packages_view/categories.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

class BottomModalSheet extends StatefulWidget {
  final DocumentSnapshot? document;
  BottomModalSheet({Key? key, this.document}) : super(key: key);

  @override
  _BottomModalSheetState createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends State<BottomModalSheet> {
  final controller = Get.find<HomeController>();
  final _currentDate = DateTime.now();
  final _dayFormatter = DateFormat('d');
  final dates = ['اليوم', 'غدا'];
  var daySelected = 0;
  var timeSelected = 0;

  var time = [
    "07:00",
    '06:00',
    '05:00',
    '04:00',
    '03:00',
    '02:00',
    '01:00',
  ];

  @override
  void initState() {
    getNextDays();
    controller.bookingday = dates[0];
    controller.bookingtime = time[0];
    super.initState();
  }

  getNextDays() {
    for (int i = 2; i < 7; i++) {
      final date = _currentDate.add(Duration(days: i));
      dates.add(_dayFormatter.format(date).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: TextButton.icon(onPressed: () {}, icon: Image.asset('assets/calendar.png'), label: "حدد اليوم".text.semiBold.make())),
          "يناير".text.size(16).cyan400.make(),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: dates
                  .mapIndexed((currentValue, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            daySelected = index;
                            controller.bookingday = currentValue;
                          });
                        },
                        child: Card(
                          elevation: 5.0,
                          color: daySelected == index ? shadowColor : Colors.white,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                            child: currentValue.toString().text.color(daySelected == index ? Colors.white : Colors.black).semiBold.make(),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          TextButton.icon(onPressed: () {}, icon: Image.asset("assets/earth.png"), label: "حدد الوقت".text.semiBold.make()),
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: time
                  .mapIndexed((currentValue, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            timeSelected = index;
                            controller.bookingtime = currentValue;
                          });
                        },
                        child: Card(
                          color: timeSelected == index ? shadowColor : Colors.white,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                            child: currentValue.text.color(timeSelected == index ? Colors.white : Colors.black).semiBold.make(),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          10.heightBox,
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                if (controller.bookingday.isNotEmpty && controller.bookingtime.isNotEmpty) {
                  Get.back();
                  Get.to(() => Categories(document: widget.document));
                }
              },
              child: CircleAvatar(
                backgroundColor: navbarColor,
                radius: 40,
                child: "استمرار".text.white.make(),
              ),
            ),
          )
        ],
      ),
    );
    //
  }
}

import 'package:flutter/material.dart';

import 'package:hoseapp/views/booking_view/components/one.dart';
import 'package:hoseapp/views/booking_view/components/two.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> with SingleTickerProviderStateMixin {
  // define your tab controller here
  late TabController _tabController1;

  @override
  void initState() {
    // initialise your tab controller here

    super.initState();
    _tabController1 = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_ic.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                color: Colors.white,
                alignment: Alignment.centerRight,
                child: Text(
                  'حجوزاتي',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff28476E),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                child: TabBar(
                  controller: _tabController1,
                  unselectedLabelColor: Color(0xff9890B8),
                  labelColor: Color(0xff28476E),
                  labelPadding: EdgeInsets.symmetric(horizontal: 5),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Color(0xff35DDDE),
                        offset: Offset(1, 1),
                        spreadRadius: 2,
                      )
                    ],
                    color: Colors.white,
                  ),
                  tabs: <Widget>[
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'سابقة',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'قادمة',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.93,
              child: TabBarView(
                controller: _tabController1,
                children: <Widget>[
                  One(),
                  Two(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

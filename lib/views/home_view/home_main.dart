import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/controllers/home_controller.dart';
import 'package:hoseapp/views/booking_view/booking_screen.dart';
import 'package:hoseapp/views/home_view/components/exit_dialog.dart';
import 'package:hoseapp/views/home_view/components/home_screen.dart';
import 'package:hoseapp/views/home_view/components/my_cars_screen.dart';
import 'package:hoseapp/views/profile_view/profile_screen.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int index = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget curentScreen = HomeScreen();
  final controller = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () {
          if (index == 2) {
            Get.offAll(() => HomeMain());
          }
        },
        child: Card(
          elevation: 5,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 33,
              backgroundColor: Color(0xff35DDDE),
              child: Center(
                child: Text(
                  'استمرار',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white.withOpacity(0.5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: Color(0xff28476E),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          curentScreen = HomeScreen();
                          index = 0;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(backgroundColor: Colors.white, radius: 20, child: Image.asset('assets/Group 608.png')),
                            Text(
                              "الرئيسية",
                              style: TextStyle(
                                color: index == 0 ? Color(0xff35DDDE) : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          curentScreen = BookingScreen();

                          index = 1;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(backgroundColor: Colors.white, radius: 20, child: Image.asset('assets/2.png')),
                            Text(
                              "الحجوزات",
                              style: TextStyle(
                                color: index == 1 ? Color(0xff35DDDE) : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox.shrink(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          curentScreen = MyCarsScreen();
                          index = 2;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(backgroundColor: Colors.white, radius: 20, child: Image.asset('assets/sports-car.png')),
                            Text(
                              "المركبات",
                              style: TextStyle(
                                color: index == 2 ? Color(0xff35DDDE) : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          curentScreen = ProfileScreen();
                          index = 3;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(backgroundColor: Colors.white, radius: 20, child: Image.asset('assets/peson.png')),
                            Text(
                              "الحساب",
                              style: TextStyle(
                                color: index == 3 ? Color(0xff35DDDE) : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: WillPopScope(
          onWillPop: () async {
            showDialog(context: context, builder: (context) => exitDialog());
            return false;
          },
          child: SafeArea(child: PageStorage(bucket: bucket, child: curentScreen))),
    );
  }
}

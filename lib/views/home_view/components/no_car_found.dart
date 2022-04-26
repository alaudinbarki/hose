import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/importer.dart';
import 'package:hoseapp/views/add_car_view/add_your_car_screen.dart';

class NoCarFoundScreen extends StatelessWidget {
  const NoCarFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddYourCarScreen());
        },
        backgroundColor: Colors.white,
        child: VxBadge(
          color: Colors.white,
          optionalWidget: "+".text.black.make(),
          position: VxBadgePosition.rightBottom,
          child: Image.asset('assets/car_ic.png'),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/background_ic.png"), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextButton.icon(
            //   label: Text(
            //     "أضف سيارة",
            //     style: TextStyle(color: Colors.black),
            //   ),
            //   onPressed: () {
            //     Get.to(() => AddYourCarScreen());
            //   },
            //   icon: Image.asset('assets/car_ic.png'),
            // ),
            SizedBox(
              width: double.infinity,
              height: 600,
              child: Card(
                color: Colors.white.withOpacity(0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/noCar.png"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "ليس لديك أي مركبات",
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "اضف مركبتك الان وابدأ في  حجز موعد",
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

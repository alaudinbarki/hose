import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/controllers/home_controller.dart';
import 'package:hoseapp/views/checkout_view/checkout_screen.dart';
import 'package:hoseapp/views/packages_view/components/rates.dart';
import 'package:velocity_x/velocity_x.dart';

class PackageDetailsScreen extends StatelessWidget {
  final DocumentSnapshot? document;
  final DocumentSnapshot? prevDocument;
  final HomeController? controller;
  final int? index;
  const PackageDetailsScreen({Key? key, this.document, this.controller, this.index, this.prevDocument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/background.png"), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    'assets/backarrow.png',
                    width: 80,
                  ),
                ),
              ),
              20.heightBox,
              Container(
                width: double.infinity,
                height: 600,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.all(16.0),
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
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                document!['image'],
                                width: 65,
                                height: 65,
                              ),
                              5.heightBox,
                              document!['name'].toString().text.align(TextAlign.center).size(16).make()
                            ],
                          ),
                        ),
                      ),
                      10.heightBox,
                      "اختر مما يلي".text.size(16).semiBold.letterSpacing(1).wordSpacing(1).make(),
                      Divider(),
                      10.heightBox,
                      prevDocument!['carType'] == 'bike'
                          ? rates(document, "غسيل دراجة نارية", 'price').onTap(() {
                              Get.to(() => CheckoutScreen(
                                  document: prevDocument,
                                  index: index,
                                  image: document!['image'],
                                  bookingType: document!['name'],
                                  price: document!['price'],
                                  title: "غسيل دراجة نارية"));
                            })
                          : prevDocument!['carType'] == 'smallCar'
                              ? rates(document, "للسيارة الصغيرة", 'small_car_price').onTap(() {
                                  Get.to(() => CheckoutScreen(
                                      document: prevDocument,
                                      index: index,
                                      bookingType: document!['name'],
                                      image: document!['image'],
                                      price: document!['small_car_price'],
                                      title: "للسيارة الصغيرة"));
                                })
                              : SizedBox(),
                      10.heightBox,
                      prevDocument!['carType'] != 'bike' && prevDocument!['carType'] == 'bigCar'
                          ? rates(document, "للسيارة الكبيرة", 'big_car_price').onTap(() {
                              Get.to(() => CheckoutScreen(
                                    document: prevDocument,
                                    index: index,
                                    bookingType: document!['name'],
                                    image: document!['image'],
                                    price: document!['big_car_price'],
                                    title: "للسيارة الكبيرة",
                                  ));
                            })
                          : SizedBox(),
                      20.heightBox,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        alignment: Alignment.centerRight,
                        child: ":يشمل".text.size(16).semiBold.make(),
                      ),
                      10.heightBox,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        alignment: Alignment.centerRight,
                        child: Text(
                          document!['about'],
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

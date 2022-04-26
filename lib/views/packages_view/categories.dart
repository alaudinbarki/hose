import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hoseapp/consts/consts.dart';
import 'package:hoseapp/controllers/home_controller.dart';
import 'package:hoseapp/services/store_services.dart';
import 'package:hoseapp/views/packages_view/components/package_details.dart';
import 'package:velocity_x/velocity_x.dart';

class Categories extends StatefulWidget {
  final DocumentSnapshot? document;
  Categories({Key? key, this.document}) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final controller = Get.find<HomeController>();
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
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/backarrow.png')),
                    Text(language == 'english' ? 'Packages' : 'الباقات', textAlign: TextAlign.right, style: TextStyle(fontSize: 16, color: Color(0xff28476E))),
                  ],
                ),
              ),
              10.heightBox,
              widget.document!['carType'] == "bike"
                  ? StreamBuilder(
                      stream: StoreServices.getServices(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                        print(snapshot.data!.docs.length);
                        if (snapshot.data!.docs.length == 0)
                          return Center(
                            child: "No services available".text.make(),
                          );
                        else {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: ListView(
                                shrinkWrap: true,
                                children: snapshot.data!.docs
                                    .mapIndexed(
                                      (DocumentSnapshot document, index) => GestureDetector(
                                        onTap: () {
                                          Get.to(() => PackageDetailsScreen(
                                                prevDocument: widget.document,
                                                index: index,
                                                controller: controller,
                                                document: document,
                                              ));
                                        },
                                        child: document['name'] == "غسيل دراجة نارية"
                                            ? Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Center(
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
                                                          document['image'],
                                                          width: 65,
                                                          height: 65,
                                                        ),
                                                        5.heightBox,
                                                        document['name'].toString().text.align(TextAlign.center).size(16).make()
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        }
                      })
                  : StreamBuilder(
                      stream: StoreServices.getServices(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                        print(snapshot.data!.docs.length);
                        if (snapshot.data!.docs.length == 0)
                          return Center(
                            child: "No services available".text.make(),
                          );
                        else {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: ListView(
                                shrinkWrap: true,
                                children: snapshot.data!.docs
                                    .mapIndexed(
                                      (DocumentSnapshot document, index) => GestureDetector(
                                        onTap: () {
                                          Get.to(() => PackageDetailsScreen(
                                                prevDocument: widget.document,
                                                index: index,
                                                controller: controller,
                                                document: document,
                                              ));
                                        },
                                        child: document['name'] != "غسيل دراجة نارية"
                                            ? Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Center(
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
                                                          document['image'],
                                                          width: 65,
                                                          height: 65,
                                                        ),
                                                        5.heightBox,
                                                        document['name'].toString().text.align(TextAlign.center).size(16).make()
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        }
                      }),
            ],
          ),
        ),
      ),
    );
  }
}

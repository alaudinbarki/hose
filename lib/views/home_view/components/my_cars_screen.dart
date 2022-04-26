import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/firebase_consts.dart';
import 'package:hoseapp/consts/importer.dart';
import 'package:hoseapp/controllers/home_controller.dart';
import 'package:hoseapp/services/store_services.dart';
import 'package:hoseapp/views/add_car_view/add_your_car_screen.dart';
import 'package:hoseapp/views/add_car_view/components.dart/edit_screen.dart';
import 'package:hoseapp/views/home_view/components/no_car_found.dart';

class MyCarsScreen extends StatefulWidget {
  @override
  _MyCarsScreenState createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen> {
  final controller = Get.find<HomeController>();
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
      body: StreamBuilder(
          stream: StoreServices.getCars(currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
            print(snapshot.data!.docs.length);
            if (snapshot.data!.docs.length == 0)
              return NoCarFoundScreen();
            else {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/background_ic.png"), fit: BoxFit.cover),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: snapshot.data!.docs
                        .mapIndexed(
                          (DocumentSnapshot document, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.selectedCar = index;
                                controller.selectedCarType = document['carType'].toString();
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                      color:
                                          controller.selectedCar == index && snapshot.data!.docs.length > 1 ? Colors.cyanAccent.withOpacity(0.3) : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      _showMyDialog(document.id, index);
                                                    },
                                                    child: Image.asset('assets/delete1.png')),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      Get.to(() => EditScreen(
                                                            snapshot: document,
                                                          ));
                                                    },
                                                    child: Image.asset('assets/edit.png')),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/car_logos/${document['category']}.png",
                                                  width: 24,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(12),
                                                  child: Image.network(
                                                    document['imageUrl'],
                                                    width: 120,
                                                    height: 120,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('( ${document['subcategory']} )\t',
                                                        textAlign: TextAlign.right, style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                                    Text("${document['category']}",
                                                        textAlign: TextAlign.right, style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("${document['alphabets']} ${document['digits']}",
                                                        textAlign: TextAlign.right, style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                                    Text('رقم اللوحة', textAlign: TextAlign.right, style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ));
            }
          }),
    );
  }

  _showMyDialog(id, index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              height: 250,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                children: [
                  Text(
                    'هل انت متأكد من حذف السيارة ؟ ',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/delete.png'),
                      Image.asset('assets/arrow.png'),
                      Image.asset('assets/blackCar.png'),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Color(0xff28476E),
                            child: Center(
                              child: Text(
                                'لا',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (index > 0) {
                          controller.selectedCar = 0;
                          setState(() {});
                        }
                        var doc = store.collection(carsCollection);
                        await doc.doc(id).delete();
                        Navigator.pop(context);

                        _showMyDialog1();
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Color(0xff35DDDE),
                            child: Center(
                              child: Text(
                                'نعم',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ));
      },
    );
  }

  _showMyDialog1() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            height: 170,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: [
                Text(
                  'تم حذف السيارة بنجاح',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/ok.png')),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

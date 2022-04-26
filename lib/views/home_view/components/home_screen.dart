import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hoseapp/consts/firebase_consts.dart';
import 'package:hoseapp/controllers/home_controller.dart';
import 'package:hoseapp/services/store_services.dart';
import 'package:hoseapp/views/add_car_view/add_your_car_screen.dart';
import 'package:hoseapp/views/home_view/components/bottomsheet.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => homeController.loading.value
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  GoogleMap(
                    onTap: (argument) {
                      setState(() {
                        homeController.myposition.value = argument;
                      });
                    },
                    markers: {
                      Marker(
                          markerId: MarkerId('mapMarker'),
                          icon: BitmapDescriptor.defaultMarker,
                          position: homeController.myposition.value,
                          infoWindow: InfoWindow(title: "You"))
                    },
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(target: homeController.myposition.value, zoom: 15),
                    onMapCreated: (GoogleMapController controller) {
                      homeController.mapController.complete(controller);
                    },
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                  Positioned(
                    child: CircleAvatar(
                      child: Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                    right: 12,
                    top: 6,
                  ),
                  Positioned(
                      bottom: 0,
                      child: StreamBuilder(
                          stream: StoreServices.getCars(currentUser!.uid),
                          // stream: homeController.getCars(currentUser!.uid),
                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                            print(snapshot.data!.docs.length);
                            if (snapshot.data!.docs.length == 0)
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    width: MediaQuery.of(context).size.width,
                                    height: 120,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Container(
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
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 5.0, padding: EdgeInsets.all(8.0)),
                                            onPressed: () {
                                              Get.to(() => AddYourCarScreen());
                                            },
                                            child: "اضف مركبة".text.black.xl.semiBold.make(),
                                          ),
                                        )),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                "assets/calendar.png",
                                                width: 80,
                                              ),
                                            ),
                                            "الجدول".text.make()
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            else {
                              var document = snapshot.data!.docs;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                                    width: MediaQuery.of(context).size.width,
                                    height: 120,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Container(
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
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Image.network(
                                                  document[homeController.selectedCar]['imageUrl'],
                                                  width: 80,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('( ${document[homeController.selectedCar]['subcategory']})\t',
                                                            textAlign: TextAlign.right, style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                                        Text("${document[homeController.selectedCar]['category']}",
                                                            textAlign: TextAlign.right, style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            "${document[homeController.selectedCar]['alphabets']} ${document[homeController.selectedCar]['digits']}",
                                                            textAlign: TextAlign.right,
                                                            style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                                        Text(' :رقم اللوحة',
                                                            textAlign: TextAlign.right, style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                        10.widthBox,
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Card(
                                              elevation: 5.0,
                                              shadowColor: Colors.cyan,
                                              child: IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      context: context, builder: (context) => BottomModalSheet(document: document[homeController.selectedCar]));
                                                },
                                                icon: Image.asset(
                                                  "assets/calendar.png",
                                                  width: 80,
                                                ),
                                              ),
                                            ),
                                            "الجدول".text.make()
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          }))
                ],
              ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: homeController.gotoMyPosition,
          child: Icon(
            Icons.location_searching_rounded,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

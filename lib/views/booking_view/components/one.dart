import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hoseapp/consts/firebase_consts.dart';
import 'package:hoseapp/services/store_services.dart';
import 'package:hoseapp/views/booking_view/components/no_prev_booking.dart';
import 'package:velocity_x/velocity_x.dart';

class One extends StatefulWidget {
  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 50),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: StreamBuilder(
          stream: StoreServices.getPrevBookings(currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
            print(snapshot.data!.docs.length);
            if (snapshot.data!.docs.length == 0) return noPrevBooking();
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: snapshot.data!.docs.mapIndexed((DocumentSnapshot document, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
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
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  document['imageUrl'],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              20.heightBox,
                              "Day: ${document['booking_day']} - Time: ${document['booking_time']}".text.make()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text('( ${document['car_subcategory']} )',
                                      textAlign: TextAlign.right, style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                  Text("${document['car_category']}", textAlign: TextAlign.right, style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("${document['car_number']}", textAlign: TextAlign.right, style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                  Text(' :رقم اللوحة', textAlign: TextAlign.right, style: TextStyle(fontSize: 13, color: Color(0xff28476E))),
                                ],
                              ),
                              20.heightBox,
                              Container(
                                width: context.screenWidth / 3,
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
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      document['service_index'] == 0
                                          ? 'assets/home1.png'
                                          : document['service_index'] == 1
                                              ? 'assets/home2.png'
                                              : document['service_index'] == 2
                                                  ? 'assets/home3.png'
                                                  : 'assets/home4.png',
                                      width: 28,
                                      height: 28,
                                    ),
                                    5.heightBox,
                                    "${document['booking_type']} | ${document['service_type']}".text.maxLines(1).make()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          }),
    );
  }
}

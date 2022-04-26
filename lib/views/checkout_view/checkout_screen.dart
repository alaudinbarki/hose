import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/firebase_consts.dart';
import 'package:hoseapp/controllers/home_controller.dart';
import 'package:hoseapp/services/store_services.dart';
import 'package:hoseapp/views/checkout_view/components/success_dialog.dart';
import 'package:hoseapp/views/checkout_view/visa_payment_screen.dart';
import 'package:pay/pay.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckoutScreen extends StatefulWidget {
  final String? bookingType;
  final String? price;
  final String? image;
  final String? title;
  final int? index;
  final DocumentSnapshot? document;
  CheckoutScreen({Key? key, this.bookingType, this.price, this.image, this.title, this.index, this.document});
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var stc = false;
  var pay = true;
  var mada = false;
  var visa = false;
  var cod = false;

  final paymentItems = <PaymentItem>[];
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    paymentItems.add(PaymentItem(amount: '${widget.price}', label: "${widget.bookingType}", status: PaymentItemStatus.final_price));
  }

  @override
  Widget build(BuildContext context) {
    var total = (14 / 100) * int.parse(widget.price.toString()) + int.parse(widget.price.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/background_ic.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                  padding: EdgeInsets.only(
                    top: 15,
                    right: 20,
                    left: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/backarrow.png'),
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset('assets/cart.png'),
                              ),
                              Row(children: [
                                Text(
                                  'ريال',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 13, color: Color(0xff3CD4D0)),
                                ),
                                Text(
                                  widget.price.toString(),
                                  style: TextStyle(fontSize: 13, color: Color(0xff3CD4D0)),
                                )
                              ]),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 10, top: 5, bottom: 5),
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'ريال',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff28476E),
                                  ),
                                ),
                                Text(
                                  '${widget.price}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff28476E),
                                  ),
                                ),
                              ],
                            ),
                            Text('|'),
                            Text(
                              "${widget.title}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff28476E),
                              ),
                            ),
                            Text('|'),
                            Text(
                              "${widget.bookingType}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff28476E),
                              ),
                            ),
                            Image.network("${widget.image}")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                        color: Color(0xff52818F),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '14%',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff28476E),
                            ),
                          ),
                          Text(
                            'الضريبة',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff28476E),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'ريال',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff28476E),
                                ),
                              ),
                              Text(
                                total.toString(),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff28476E),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'المجموع',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff28476E),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'طريقة الدفع',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff28476E),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'assets/Image 8.png',
                                    height: 15,
                                  ),
                                  Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      value: stc,
                                      onChanged: (value) {
                                        setState(() {
                                          stc = value!;
                                        });
                                      })
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/Image 7.png',
                                    height: 20,
                                  ),
                                  Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      value: pay,
                                      onChanged: (value) {
                                        setState(() {
                                          pay = value!;
                                        });
                                      })
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'assets/mada.png',
                                    height: 12,
                                  ),
                                  Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      // tristate: true,
                                      value: mada,
                                      onChanged: (value) {
                                        setState(() {
                                          mada = value!;
                                        });
                                      })
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.011,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Image.asset('assets/visa.png'),
                                  Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      // tristate: true,
                                      value: visa,
                                      onChanged: (value) {
                                        setState(() {
                                          visa = value!;
                                        });
                                      })
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  "Cash on delivery".text.size(14).make(),
                                  Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      // tristate: true,
                                      value: cod,
                                      onChanged: (value) {
                                        setState(() {
                                          cod = value!;
                                        });
                                      })
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(border: InputBorder.none, hintText: 'اضف كوبون', hintStyle: TextStyle(color: Color(0xffB5B5B5)))),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      pay
                          ? GooglePayButton(
                              type: GooglePayButtonType.pay,
                              height: 60,
                              width: 150,
                              paymentConfigurationAsset: 'gpay.json',
                              loadingIndicator: const Center(
                                child: CircularProgressIndicator(),
                              ),
                              onPaymentResult: (data) {
                                print(data);
                                showDialog(context: context, builder: (context) => successDialog(context));
                              },
                              paymentItems: paymentItems)
                          : InkWell(
                              onTap: () async {
                                if (visa) {
                                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => VisaPaymentScreen()));
                                } else if (cod) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                            child: Container(
                                                height: 200,
                                                width: double.infinity,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CircularProgressIndicator(),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "خدمة الحجز",
                                                      style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
                                                    )
                                                  ],
                                                )),
                                          ));
                                  var user;
                                  await store.collection(usersCollection).where('id', isEqualTo: currentUser!.uid).get().then((value) {
                                    if (value.docs.length > 0) {
                                      user = value.docs[0];
                                    }
                                  });
                                  await StoreServices.storeBooking(
                                          serviceIndex: widget.document!['carType'] == 'bike' ? 4 : widget.index,
                                          address: controller.address.value,
                                          latitude: controller.myposition.value.latitude.toString(),
                                          longitude: controller.myposition.value.longitude.toString(),
                                          bookingType: widget.bookingType,
                                          carImage: widget.document!['imageUrl'],
                                          carNumber: "${widget.document!['alphabets']} ${widget.document!['digits']}",
                                          day: controller.bookingday,
                                          ownerContact: user['phone'],
                                          ownerName: user['name'],
                                          price: widget.price.toString(),
                                          time: controller.bookingtime,
                                          category: widget.document!['category'],
                                          subcatgory: widget.document!['subcategory'],
                                          serviceType: widget.title)
                                      .then((value) {
                                    Navigator.pop(context);
                                    showDialog(context: context, builder: (context) => successDialog(context));
                                  });
                                }
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
                                child: CircleAvatar(
                                  radius: 55,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Color(0xff35DDDE),
                                    child: Center(
                                      child: Text(
                                        'دفع',
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hoseapp/views/checkout_view/confirm_checkout_screen.dart';

class VisaPaymentScreen extends StatefulWidget {
  @override
  _VisaPaymentScreenState createState() => _VisaPaymentScreenState();
}

class _VisaPaymentScreenState extends State<VisaPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/background_ic.png"), fit: BoxFit.cover),
          ),
          child: Column(children: [
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(
                top: 15,
                right: 20,
                left: 20,
                bottom: 90,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
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
                            '90',
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
                Image.asset('assets/visaCard.png'),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  isDense: true, border: InputBorder.none, hintText: 'اسم العائلة', hintStyle: TextStyle(color: Color(0xffB5B5B5)))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  isDense: true, border: InputBorder.none, hintText: 'الاسم الاول', hintStyle: TextStyle(color: Color(0xffB5B5B5)))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffF2F3F4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset('assets/visamaster.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset('assets/mada.png'),
                  ]),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                        textAlign: TextAlign.right,
                        decoration:
                            InputDecoration(isDense: true, border: InputBorder.none, hintText: 'رقم البطاقة', hintStyle: TextStyle(color: Color(0xffB5B5B5)))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'CSC  ',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'تاريخ الانتهاء  ',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                              textAlign: TextAlign.right,
                              decoration:
                                  InputDecoration(isDense: true, border: InputBorder.none, hintText: 'ارقام ', hintStyle: TextStyle(color: Color(0xffB5B5B5)))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                hintText: 'MM/YY',
                                hintStyle: TextStyle(color: Color(0xffB5B5B5), fontSize: 15),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => ConfirmCheckoutScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff0070BA),
                    ),
                    child: Center(
                      child: Text(
                        'اضافة',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ConfirmCheckoutScreen extends StatefulWidget {
  @override
  _ConfirmCheckoutScreenState createState() => _ConfirmCheckoutScreenState();
}

class _ConfirmCheckoutScreenState extends State<ConfirmCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              bottom: 250,
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
                            // Navigator.push(context, MaterialPageRoute(builder: (ctx) => MyCar()));
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
                  height: 200,
                ),
                Text(
                  'ادخل الرمز المرسل ',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                        textAlign: TextAlign.center,
                        decoration:
                            InputDecoration(isDense: true, border: InputBorder.none, hintText: 'رمز التحقق', hintStyle: TextStyle(color: Color(0xffB5B5B5)))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    _showMyDialog();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff0070BA),
                    ),
                    child: Center(
                      child: Text(
                        'تحقق',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  _showMyDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              height: 200,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                children: [
                  Text(
                    'نجحت العملية',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset('assets/ok.png'),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _showMyDialog1();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff0070BA),
                      ),
                      child: Center(
                        child: Text(
                          'انتهاء',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  )
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
              height: 200,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                children: [
                  Text(
                    'فشلت العميلة',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset('assets/close.png'),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff0070BA),
                      ),
                      child: Center(
                        child: Text(
                          'تحقق',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}

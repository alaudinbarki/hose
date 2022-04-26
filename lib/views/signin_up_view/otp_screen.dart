import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/views/home_view/components/home_screen.dart';
import 'package:hoseapp/views/signin_up_view/signup.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../../consts/consts.dart';

class OTP_Screen extends StatefulWidget {
  final String phone;
  OTP_Screen(this.phone);

  @override
  State<OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    //color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              language == 'english'
                  ? 'Mobile Number Verification'
                  : 'التحقق من رقم الجوال',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                language == 'english'
                    ? 'Enter the number sent to your mobile number.'
                    : ' أدخل الرقم المرسل لرقم جوالک.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.teal),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                onSubmit: (pin) async {

                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // GestureDetector(
            //   onTap: () => Get.to(HomeScreen()),
            //   child: Container(
            //     width: MediaQuery
            //         .of(context)
            //         .size
            //         .width,
            //     height: MediaQuery
            //         .of(context)
            //         .size
            //         .height * 0.07,
            //     padding: EdgeInsets.symmetric(vertical: 10),
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Color(0xff35DDDE)),
            //         borderRadius: BorderRadius.circular(15),
            //         color: Color(0xff28476E)
            //     ),
            //     child: Center(
            //       child: Text(
            //         language == 'english' ? 'Verification' : 'التحقق',
            //         style: TextStyle(fontSize: 16,
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            CupertinoAlertDialog(
              title: Text("Phone Authentication"),
              content: Text("Phone Number verified!!!"),
              actions: [
                CupertinoButton(
                    child: Text('Close'),
                    onPressed: () {
                      () => Get.to(SignUpScreen());
                    }),
              ],
            );
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID!;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  verify_function() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '${widget.phone}',
          verificationCompleted:
              (AuthCredential credential) async {
            Navigator.of(context).pop();
            FirebaseAuth _auth = FirebaseAuth.instance;

            UserCredential result =
            await _auth.signInWithCredential(credential);

            User? user = result.user;

            if (user != null) {
              Get.to(() => SignUpScreen());
            } else {
              print("Error");
            }
          },
          verificationFailed: (FirebaseAuthException exception) {
            print(exception);
          },
          codeSent: (String? verficationID, int? resendToken) {
            setState(() {
              _verificationCode = verficationID!;
            });
          },
          codeAutoRetrievalTimeout: (String verificationID) {
            setState(() {
              _verificationCode = verificationID;
            });
          },
          timeout: Duration(seconds: 120));
    } catch (e) {
      FocusScope.of(context).unfocus();
      _scaffoldkey.currentState
          ?.showSnackBar(SnackBar(content: Text('invalid OTP')));
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/consts.dart';
import 'package:hoseapp/consts/firebase_consts.dart';
import 'package:hoseapp/consts/importer.dart';
import 'package:hoseapp/controllers/home_controller.dart';
import 'package:hoseapp/services/store_services.dart';
import 'package:hoseapp/views/profile_view/components/edit_profile_screen.dart';
import 'package:hoseapp/views/profile_view/components/fix_profile_screen.dart';
import 'package:hoseapp/views/signin_up_view/signin.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var edit = false;
  var formKey = GlobalKey<FormState>();
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background_ic.png'), fit: BoxFit.cover),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(30)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  language == 'english' ? 'Settings' : 'الاعدادات',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                StreamBuilder(
                    stream: StoreServices.getUser(currentUser!.uid),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                      print(snapshot.data!.docs.length);
                      if (snapshot.data!.docs.length == 0)
                        return Container();
                      else {
                        var document = snapshot.data!.docs[0];
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 85,
                              backgroundColor: Colors.white.withOpacity(0.5),
                              child: CircleAvatar(
                                radius: 75,
                                backgroundColor: Colors.white.withOpacity(0.7),
                                child: CircleAvatar(
                                  radius: 65,
                                  backgroundColor: Colors.white.withOpacity(0.9),
                                  child: CircleAvatar(
                                    radius: 55,
                                    backgroundColor: Colors.white,
                                    child: document['profile_image'] == ''
                                        ? Icon(
                                            Icons.person,
                                            size: 45,
                                            color: Colors.black,
                                          )
                                        : ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Image.network(
                                              document['profile_image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            10.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/Group 62.png").onTap(() async {
                                      await controller.pickProfileImage(context: context);
                                      await StoreServices.uploadProfileImage(controller.profileImage);
                                      await StoreServices.storeProfileImage();
                                      VxToast.show(context, msg: "Profile Picture updated");
                                    }),
                                    Image.asset("assets/Group 61.png").onTap(() {
                                      setState(() {
                                        edit = !edit;
                                      });
                                    }),
                                  ],
                                ),
                                Column(
                                  children: [
                                    "${document['name']}".text.xl.color(Color(0xff28476E)).make(),
                                    5.heightBox,
                                    "${document['email']}".text.size(16).color(Color(0xff28476E)).make(),
                                  ],
                                )
                              ],
                            ),
                            edit
                                ? EditProfile(
                                    document: document,
                                    edit: edit,
                                  )
                                : fixedScreen(),
                          ],
                        );
                      }
                    }),

                // ///SignOut
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();

                    VxToast.show(context, msg: "Logged out");
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => SigninScreen()), (route) => false);
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            language == 'english' ? 'Sign out  ' : "تسجيل الخروج  ",
                            style: TextStyle(fontSize: 15, fontFamily: 'JF Flat'),
                          ),
                          Image.asset('assets/logout.png')
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 25.0,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  whatsAppLaunch() async {
    var whatsAppUrl = "whatsapp://send?phone=+966500848413";
    await canLaunch(whatsAppUrl) ? launch(whatsAppUrl) : VxToast.show(context, msg: "Please install whatsapp");
  }

  snapchatLaunch() async {
    var whatsAppUrl = "https://www.snapchat.com/add/mashaheer_j2020?share_id=MDFDRDE2&locale=en_PK";
    await canLaunch(whatsAppUrl) ? launch(whatsAppUrl) : VxToast.show(context, msg: "Please install snapchat");
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/consts.dart';
import 'package:hoseapp/views/home_view/home_main.dart';
import 'package:hoseapp/views/intro_view/select_lang_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isUser = false;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null && mounted) {
        setState(() {
          isUser = false;
        });
      } else if (mounted && user != null) {
        setState(() {
          isUser = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isUser ? HomeMain() : SelectLanguageScreen(),
    );
  }
}

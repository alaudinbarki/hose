import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hoseapp/consts/firebase_consts.dart';

class AuthController extends GetxController {
  static AuthController authController = Get.find();
  var googleSignIn = GoogleSignIn();

  var error;

  Future<UserCredential?> signin(email, password) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      error = e.message.toString();
    }
    return userCredential;
  }

  Future<UserCredential?> signup({email, password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      error = e.message.toString();
    } catch (e) {
      print(e);
    }
    return userCredential;
  }

  googleSignin() async {
    final user = await googleSignIn.signIn();
    if (user != null) {
      print(user);
      final googleAuth = await user.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credentials);
      await storeUserData(
        email: user.email,
        gender: 'male',
        name: user.displayName,
        password: '',
        phone: '',
        username: user.displayName,
        profileUrl: user.photoUrl,
      );
    }
  }

  signout() async {
    try {
      googleSignIn.disconnect();
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> storeUserData({String? name, String? username, String? email, String? password, String? phone, String? gender, String? profileUrl}) async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference _vendors = FirebaseFirestore.instance.collection(usersCollection).doc(user!.uid);
    _vendors.set({
      'id': user.uid,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'phone': phone,
      'gender': gender,
      'profile_image': profileUrl ?? ''
    });
  }

  Future<void> updateUser({String? name, String? email, String? phone, String? gender}) async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference _vendors = FirebaseFirestore.instance.collection(usersCollection).doc(user!.uid);
    _vendors.set({'id': user.uid, 'name': name, 'email': email, 'phone': phone, 'gender': gender}, SetOptions(merge: true));
  }
}

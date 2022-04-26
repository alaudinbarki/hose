import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hoseapp/consts/firebase_consts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';

class StoreServices {
  StoreServices();

  static var imageLink = '';
  static var profileLink = '';

  static storeCar({String? carType, String? category, String? subcategory, String? color, String? digits, String? alphabets, String? imageUrl}) async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference _user = FirebaseFirestore.instance.collection(carsCollection).doc();
    _user.set({
      'userID': user!.uid,
      'carType': carType,
      'color': color,
      'digits': digits,
      'alphabets': alphabets,
      'imageUrl': imageUrl,
      'category': category,
      'subcategory': subcategory,
      'createdOn': FieldValue.serverTimestamp()
    });
  }

  static setProfileImage({String? profileImage}) async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference _user = FirebaseFirestore.instance.collection(usersCollection).doc(user!.uid);
    _user.set({'profile_image': profileLink}, SetOptions(merge: true));
  }

  static uploadImage(var file) async {
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      var filename = basename(file.path);
      var destination = "images/${currentUser!.uid}/$filename";
      Reference ref = FirebaseStorage.instance.ref().child(destination);
      await ref.putFile(file);
      var d = await ref.getDownloadURL();
      imageLink = d;
      print(imageLink);
    }
  }

  static uploadProfileImage(var file) async {
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      var filename = basename(file.path);
      var destination = "images/${currentUser!.uid}/$filename";
      Reference ref = FirebaseStorage.instance.ref().child(destination);
      await ref.putFile(file);
      var d = await ref.getDownloadURL();
      profileLink = d;
      print(profileLink);
    }
  }

  static storeProfileImage() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference _user = FirebaseFirestore.instance.collection(usersCollection).doc(user!.uid);
    _user.set({'profile_image': profileLink}, SetOptions(merge: true));
  }

  static storeBooking(
      {String? ownerName,
      int? serviceIndex,
      String? ownerContact,
      String? bookingType,
      String? time,
      String? day,
      String? carNumber,
      String? price,
      String? carImage,
      String? serviceType,
      String? latitude,
      String? longitude,
      String? category,
      String? subcatgory,
      String? address}) async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference booking = FirebaseFirestore.instance.collection(bookingCollection).doc();
    booking.set({
      'owner_name': ownerName,
      'owner_contact': ownerContact,
      'owner_id': user!.uid,
      'booking_time': time,
      'booking_day': day,
      'booking_type': bookingType,
      'service_price': price,
      'imageUrl': carImage,
      'car_number': carNumber,
      'car_category': category,
      'car_subcategory': subcatgory,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'service_index': serviceIndex,
      'service_type': serviceType,
      'service_reg_time': '${DateTime.now()}',
      'completed': false,
      'afterWashImage': null,
      'beforeWashImage': null,
      'afterWashImageTime': null,
      'beforeWashImageTime': null,
      'assigned': false,
      'assignedRider': null,
      'ds': DateTime.now().toString()
    });
  }

  static getCars(String? uid) {
    return FirebaseFirestore.instance.collection(carsCollection).where("userID", isEqualTo: uid).snapshots();
  }

  static getServices() {
    return FirebaseFirestore.instance.collection(servicesCollection).snapshots();
  }

  static getUser(id) {
    return store.collection(usersCollection).where('id', isEqualTo: id).snapshots();
  }

  static getBookings(id) {
    return store.collection(bookingCollection).where('owner_id', isEqualTo: id).where('completed', isEqualTo: false).snapshots();
  }

  static getPrevBookings(id) {
    return store.collection(bookingCollection).where('owner_id', isEqualTo: id).where('completed', isEqualTo: true).snapshots();
  }
}

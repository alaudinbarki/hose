import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hoseapp/consts/icons_const.dart';

import 'package:hoseapp/consts/importer.dart';
import 'package:hoseapp/models/categories_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  @override
  onInit() {
    getLocation();
    super.onInit();
  }

  Completer<GoogleMapController> mapController = Completer();
  var loading = false.obs;
  var myposition = LatLng(37.42796133580664, -122.085749655962).obs;
  bool serviceEnabled = false;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var address = ''.obs;
  var bookingtime = '';
  var bookingday = '';
  var selectedCar = 0;
  var selectedCarType;
  var selectedCarColor = '';
  var selectedCarModel = '';
  var selectedCarNumber = '';
  var selectedCarUrl = '';
  File? image;
  File? profileImage;
  var minicategories = ['Minicategory'];
  var minicat = 'نوع السيارة';

  var catList = [
    ford,
    nissan,
    toyota,
    merc,
    chevrolet,
    lexus,
    dodge,
    bmw,
    gmc,
    audi,
    cadillac,
    hummer,
    volks,
    landrover,
    honda,
    hyundai,
    mitsubishi,
    mazda,
    suzuki,
    infinity,
    jeep,
    porsche,
    chrysler,
    kia,
    changan,
    buick,
    aston,
    daewoo,
    citroen,
    chery,
    ferrari,
    faw,
    daihatsu,
    geely,
    gac,
    fiat,
    isuzu,
    haval,
    greatwall,
    mercury,
    lamborghini,
    jaguar,
    opel,
    mg,
    maserati,
    renault,
    proton,
    peugeot,
    seat,
    saab,
    rollroyce,
    subaru,
    sangyong,
    skoda,
    zxauto,
    volvo
  ];

  Future<void> gotoMyPosition() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(latitude.value, longitude.value),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
    )));
  }

  getLocation() async {
    loading.value = true;
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error("Location services are disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions permanently denied');
    }

    var pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    myposition.value = LatLng(pos.latitude, pos.longitude);
    latitude.value = pos.latitude;
    longitude.value = pos.longitude;
    getAddressFromLatLng(pos);
  }

  Future<void> getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    address.value = "${place.locality},${place.country}";
    loading.value = false;

    print("LATITUDE IS====== ${position.latitude}");
    print("Longitiude IS====== ${position.longitude}");
    print("ADDRESS IS $address");
  }

  Future pickImage({StateSetter? setState, context, ImageSource? source}) async {
    Navigator.pop(context);
    await Permission.photos.request();
    await Permission.camera.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      try {
        final image = await ImagePicker().pickImage(source: source!, imageQuality: 30);
        if (image == null) return;
        final imageTemp = File(image.path);
        setState!(() {
          this.image = imageTemp;
        });
      } on PlatformException catch (e) {
        print("failed to get image $e");
      }
    } else {
      VxToast.show(context, msg: "Permission denied");
    }
  }

  Future pickProfileImage({context}) async {
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 30);
        if (image == null) return;
        final imageTemp = File(image.path);
        this.profileImage = imageTemp;
      } on PlatformException catch (e) {
        print("failed to get image $e");
      }
    } else {
      VxToast.show(context, msg: "Permission denied");
    }
  }

  createMiniCategory(context, String? cat) async {
    minicategories.clear();
    minicat = 'نوع السيارة';
    print('data is here');
    var data = await DefaultAssetBundle.of(context).loadString('lib/services/categories.json');
    var res = categoriesModelFromJson(data.toString());
    var s = res.categories![0].minicategories!.where((element) => element.name == cat).toList();

    minicategories.add(minicat);

    for (var item in s[0].mincats!) {
      minicategories.add(item);
    }

    print(minicategories);
  }
}

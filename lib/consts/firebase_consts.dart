import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore store = FirebaseFirestore.instance;
User? currentUser = FirebaseAuth.instance.currentUser;

const String usersCollection = 'users';
const String bookingCollection = 'bookings';
const String carsCollection = 'cars';
const String servicesCollection = 'services';

const String prevBookingsCollection = 'prevBookings';
const String currBookingCollection = 'currentBookings';

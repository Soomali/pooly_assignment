import 'dart:math';
import 'dart:developer' as dev;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

part 'route.dart';
part 'user.dart';
part 'drive.dart';
part 'passenger.dart';
part 'sign_up_user_data.dart';
part 'driver.dart';
part 'destination.dart';

final _randomId =
    FirebaseFirestore.instance.doc('Passengers/Yb0GuDpzo0MfLbJ0GEPHvkR4tM42');
final _random = Random();

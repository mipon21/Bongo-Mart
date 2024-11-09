
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  //TODO: Add widgets Binding
  //TODO: Init Local Storage
  //TODO: Init Payment Methods
  //TODO: Await native Splash
  //Initialize Firebase


  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // ).then(
  //   (FirebaseApp value) => Get.put(AuthenticationRepository()),
  // );
  //TODO: Initialize Authentication
  runApp(const App());
}

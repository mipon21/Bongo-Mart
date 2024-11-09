import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // Initialize Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize any other services here if needed
  // Get.put(AuthenticationRepository());

  // Run the app
  runApp(const App());
}

import 'data/repositories/authentication/auth_repo.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // Initialize Flutter binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  )
  .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository())
  );        

   

  // Run the app
  runApp(const App());
}

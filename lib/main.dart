import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/UI/pages/app.dart';
import 'package:jobseeker/domain/controller/controllerfirebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetPlatform.isWeb
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAxKK62GM35Z6RxgGG6dQ5g0LlwNDBxFCw",
              authDomain: "jobseekerproject-d0d67.firebaseapp.com",
              projectId: "jobseekerproject-d0d67",
              storageBucket: "jobseekerproject-d0d67.appspot.com",
              messagingSenderId: "678613439451",
              appId: "1:678613439451:web:b5ac4dc5e2748fad650dfe"))
      : await Firebase.initializeApp();
  //Get.put(Controllerauthf());
  Get.put(ConsultasController());
  runApp(const App());
}

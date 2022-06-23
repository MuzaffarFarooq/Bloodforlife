// ignore_for_file: prefer_const_constructors

import 'package:bloodforlife/Screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBRe-YAQQkYNAVZMHCmyyPZDv8SCj37ORk",
      authDomain: "blood-for-life-8a5f2.firebaseapp.com",
      projectId: "blood-for-life-8a5f2",
      storageBucket: "blood-for-life-8a5f2.appspot.com",
      messagingSenderId: "166250731336",
      appId: "1:166250731336:web:f30eeab92ceafd037a057d",
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

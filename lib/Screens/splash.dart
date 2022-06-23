// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:bloodforlife/Screens/bottombar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'SignIn/sign_in.dart';
import 'bottom_bar.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (c, userSnapshot) {
              if (userSnapshot.hasData) {
                return const Bottombar();
              }
              return Sign_In();
            },
          ),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
          height: 300,
          width: 300,
          image: AssetImage(
            'assets/blood.jpg',
          ),
        ),
        // child: Icon(
        //   Icons.bloodtype_rounded,
        //   color: Colors.white,
        //   size: 70,
        // ),
      ),
    );
  }
}

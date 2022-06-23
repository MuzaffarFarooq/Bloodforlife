// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BloodBanks extends StatelessWidget {
  const BloodBanks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Blood Banks',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MakeRequest extends StatelessWidget {
  const MakeRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You can create a request here',
      textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
        ),),
    );
  }
}

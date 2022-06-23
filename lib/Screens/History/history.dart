// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('History of Data',
        style: TextStyle(
          fontSize: 40,
        ),),
    );
  }
}

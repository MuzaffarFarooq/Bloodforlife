// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Chat with People',
        style: TextStyle(
          fontSize: 30,
        ),),
    );
  }
}

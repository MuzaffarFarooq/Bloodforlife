// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ViewRequest extends StatelessWidget {
  const ViewRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'All Blood Requests will be shown here',
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    );
  }
}

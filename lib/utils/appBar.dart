import 'package:flutter/material.dart';

AppBar appBar({required String heading, required BuildContext context}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.blueAccent,
    title: Text(
      heading,
      style: TextStyle(color: Colors.white),
    ),
  );
}

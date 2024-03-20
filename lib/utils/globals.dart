import 'dart:io';

import 'package:flutter/cupertino.dart';

class User {
  String? name, contact, email, phone, address, billNumber;

  File? image;

  void reset() {
    name = contact = email = image = phone = address = billNumber = null;
  }
}

class Globals {
  Globals._();
  static final Globals globals = Globals._();
  User user = User();
  List<String> skill = ["", ""];
  static List<TextEditingController> nameController = [
    TextEditingController(),
    TextEditingController(),
  ];
  static List<TextEditingController> priceController = [
    TextEditingController(),
    TextEditingController(),
  ];
  static List<TextEditingController> quentyController = [
    TextEditingController(),
    TextEditingController(),
  ];
  List<User> allUsers = [];
}

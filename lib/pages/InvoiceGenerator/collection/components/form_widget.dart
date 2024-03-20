import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/globals.dart';
import '../../../widgets/my_snakbar.dart';
// import 'package:resume_builder_app/widget/my_snakbar.dart';
//
// import '../../../../utils/globals.dart';

Widget formWidgrt({required BuildContext context}) {
  GlobalKey<FormState> personlformkey = GlobalKey<FormState>();
  Size size = MediaQuery.sizeOf(context);
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: Form(
      key: personlformkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Company Name",
            style: TextStyle(
                color: Colors.deepPurple.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                height: 2),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: "Enter Your Name",
            ),
            // initialValue: Globals.globals.user.name,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            // onSaved: (val) {
            //   Globals.globals.user.name = val;
            // },
            validator: (val) {
              if (val!.isEmpty) {
                return "Must Enter Name";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            "Email",
            style: TextStyle(
                color: Colors.deepPurple.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                height: 2),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: "Enter Your Email",
            ),
            // initialValue: Globals.globals.user.email,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            // onSaved: (val) {
            //   Globals.globals.user.email = val;
            // },
            validator: (val) {
              if (val!.isEmpty) {
                return "Must Enter Email";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            "Contact",
            style: TextStyle(
                color: Colors.deepPurple.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                height: 2),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: "Enter Your Contact",
            ),
            // initialValue: Globals.globals.user.contact,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            // onSaved: (val) {
            //   Globals.globals.user.contact = val;
            // },
            validator: (val) {
              if (val!.isEmpty) {
                return "Must Enter Contact";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            "Address",
            style: TextStyle(
                color: Colors.deepPurple.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                height: 2),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: "Enter Your Address",
            ),
            // initialValue: Globals.globals.user.address,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            // onSaved: (val) {
            //   Globals.globals.user.address = val;
            // },
            validator: (val) {
              if (val!.isEmpty) {
                return "Must Enter Address";
              } else {
                return null;
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.3,
                  child: TextButton(
                    onPressed: () {
                      // Globals.globals.user.reset();
                      personlformkey.currentState!.reset();
                    },
                    child: const Text("Reset"),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      User u = User();
                      bool validater = personlformkey.currentState!.validate();
                      if (validater) {
                        personlformkey.currentState!.save();
                        u.name = Globals.globals.user.name;
                        u.address = Globals.globals.user.address;
                        u.contact = Globals.globals.user.contact;
                        u.email = Globals.globals.user.email;
                        u.image = Globals.globals.user.image as File?;

                        Globals.globals.allUsers.add(u);

                        Globals.globals.user.reset();
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        mySnackBar(
                            content: validater
                                ? "Form Saved"
                                : "Failed to validate the form",
                            color: validater ? Colors.green : Colors.red),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

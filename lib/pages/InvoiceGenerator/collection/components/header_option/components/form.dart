import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_genretor/pages/InvoiceGenerator/collection/components/header_option/components/sudmit_row.dart';
import '../../../../../../utils/globals.dart';

Widget formWidget({
  required BuildContext context,
}) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 50, sigmaX: 50),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Name
            Container(
              margin: const EdgeInsets.all(7),
              child: TextFormField(
                onSaved: (val) {
                  Globals.globals.firstName = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Must enter first name";
                  } else {
                    return null;
                  }
                },
                initialValue: Globals.globals.firstName,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: "Enter first name",
                  labelText: "First Name",
                  hintStyle: const TextStyle(
                    color: Colors.black45,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            // LastName
            Container(
              margin: const EdgeInsets.all(7),
              child: TextFormField(
                //1
                onSaved: (val) {
                  Globals.globals.lastName = val;
                },

                validator: (val) {
                  if (val!.isEmpty) {
                    return "Must enter last name";
                  } else {
                    return null;
                  }
                },
                initialValue: Globals.globals.lastName,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: "Enter last name",
                  labelText: "Last Name",
                  hintStyle: const TextStyle(
                    color: Colors.black45,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(7),
              child: TextFormField(
                onSaved: (val) {
                  Globals.globals.billNumber = val;
                },
                validator: (val) {
                  return val!.isEmpty ? "Must enter bill number" : null;
                },
                textInputAction: TextInputAction.next,
                initialValue: Globals.globals.billNumber,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.menu_book),
                  hintText: "Enter bill number",
                  labelText: "bill number",
                  hintStyle: const TextStyle(
                    color: Colors.black45,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Submit
            submitRow(formKey: formKey, context: context),
          ],
        ),
      ),
    ),
  );
}

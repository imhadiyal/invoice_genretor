import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/globals.dart';

Widget submitRow({
  required GlobalKey<FormState> formKey,
  required BuildContext context,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: () {
          Globals.globals.reset();
          formKey.currentState!.reset();
        },
        child: const Text("RESET"),
      ),
      ElevatedButton(
        onPressed: () {
          bool validated = formKey.currentState!.validate();

          if (validated) {
            // Save data of entire form
            formKey.currentState!.save();
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                validated ? "Form saved" : "Failed to validate the form",
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: validated ? Colors.green : Colors.red,
            ),
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
    ],
  );
}

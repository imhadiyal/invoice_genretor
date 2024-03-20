import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/globals.dart';

Widget imageWidget({required BuildContext context, required setState}) {
  Future<void> getImage({required ImageSource source}) async {
    ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(
      source: source,
    );

    if (file != null) {
      Globals.globals.user.image = File(file.path);
      setState(() {});
    }
  }

  Size size = MediaQuery.sizeOf(context);
  return Container(
    alignment: Alignment.center,
    height: size.height * 0.25,
    width: size.width,
    color: Colors.white,
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        SizedBox(
          height: size.height * 0.5,
          child: CircleAvatar(
            radius: size.height * 0.1,
            foregroundImage: Globals.globals.user.image != null
                ? FileImage(Globals.globals.user.image!)
                : null,
          ),
        ),
        Positioned(
          bottom: 25,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) => Center(
                    child: AlertDialog(
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Center(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    getImage(source: ImageSource.camera).then(
                                      (value) {
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                  icon: const Icon(CupertinoIcons.camera),
                                  label: const Text("Camera"),
                                ),
                              ),
                              Center(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    getImage(source: ImageSource.gallery).then(
                                      (value) {
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.image_outlined),
                                  label: const Text("Gallery"),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            highlightElevation: 10,
            backgroundColor: Colors.green.shade600,
            child: const Icon(
              Icons.photo_camera_rounded,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}

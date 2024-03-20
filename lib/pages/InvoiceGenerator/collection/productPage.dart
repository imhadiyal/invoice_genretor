import 'package:flutter/material.dart';
import 'dart:ui';

import '../../../utils/appBar.dart';
import '../../../utils/globals.dart';

class ProductOptionPage extends StatefulWidget {
  const ProductOptionPage({super.key});

  @override
  State<ProductOptionPage> createState() => _ProductOptionPageState();
}

class _ProductOptionPageState extends State<ProductOptionPage> {
  @override
  // void initState() {
  //   if (Globals.nameController.length > 5) {
  //     Globals.nameController.removeWhere((element) => element.text.isEmpty);
  //   }
  //   if (Globals.nameController.isEmpty || Globals.nameController.length < 2) {
  //     // Globals.skill = [
  //     //   '',
  //     //   '',
  //     // ];
  //     if (Globals.nameController.length == 5) {
  //       Globals.nameController.add(TextEditingController());
  //     } else {
  //       Globals.nameController.addAll([
  //         TextEditingController(),
  //         TextEditingController(),
  //       ]);
  //     }
  //   }
  //
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: appBar(heading: "Product Option", context: context),
        backgroundColor: Colors.grey.shade300,
        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // HeadingText    ===========================================================================
                  const Text(
                    'Product Details',
                    style: TextStyle(fontSize: 20),
                  ),
                  ...List.generate(
                    Globals.globals.skill.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    gapPadding: 10),
                                hintText: "Name",
                              ),
                              keyboardType: TextInputType.name,
                              controller: Globals.nameController[index],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.015,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    gapPadding: 10),
                                hintText: "Price",
                              ),
                              keyboardType: TextInputType.number,
                              controller: Globals.priceController[index],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.015,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    gapPadding: 10),
                                hintText: "Quantity",
                              ),
                              keyboardType: TextInputType.number,
                              controller: Globals.quentyController[index],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.015,
                          ),
                          // DetectButton ======================================================================
                          IconButton(
                            onPressed: () {
                              Globals.globals.skill.removeAt(index);
                              Globals.nameController.removeAt(index);
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.3,
                    child: ElevatedButton(
                      onPressed: () {
                        Globals.globals.skill.add("");
                        Globals.nameController.add(TextEditingController());
                        Globals.priceController.add(TextEditingController());
                        Globals.quentyController.add(TextEditingController());
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text('Add'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

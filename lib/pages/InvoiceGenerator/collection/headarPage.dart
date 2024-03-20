import 'package:flutter/material.dart';
import 'package:invoice_genretor/utils/appBar.dart';

import 'components/form_widget.dart';
import 'components/image_picker.dart';

class HeadarPage extends StatefulWidget {
  const HeadarPage({super.key});

  @override
  State<HeadarPage> createState() => _HeadarPageState();
}

class _HeadarPageState extends State<HeadarPage> {
  bool _pr = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: appBar(heading: "heading", context: context),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _pr = true;
                      setState(() {});
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      height: size.height * 0.07,
                      width: size.width * 0.47,
                      decoration: BoxDecoration(
                        color: (_pr == false)
                            ? Colors.white10
                            : Colors.blue.shade400,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _pr = false;
                      setState(() {});
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                      height: size.height * 0.07,
                      width: size.width * 0.47,
                      decoration: BoxDecoration(
                        color: (_pr == true)
                            ? Colors.white12
                            : Colors.blue.shade400,

                        // color: Colors.blue.shade400,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Photo",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              (_pr == true)
                  ? formWidgrt(context: context)
                  : imageWidget(context: context, setState: setState)
            ],
          ),
        ),
      ),
    );
  }
}

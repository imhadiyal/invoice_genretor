import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../../../utils/appBar.dart';
import '../../../../../utils/globals.dart';
import 'components/form.dart';

class HedersOptionPage extends StatefulWidget {
  const HedersOptionPage({super.key});

  @override
  State<HedersOptionPage> createState() => _HedersOptionPageState();
}

class _HedersOptionPageState extends State<HedersOptionPage> {
  // forChoiceRow
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    TextStyle headingStyle = const TextStyle(
      fontSize: 36,
      color: Colors.white,
      // color: Color(0xffDDE6ED),
      shadows: <Shadow>[
        Shadow(
          offset: Offset(1.5, 1.5),
          blurRadius: 0.5,
          color: Colors.grey,
        ),
      ],
    );
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        // ===========================================
        appBar: appBar(heading: "Header Option", context: context),
        backgroundColor: Colors.white,
        // ============================================
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              formWidget(context: context),
            ],
          ),
        ),
      ),
    );
  }
}

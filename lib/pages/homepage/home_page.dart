import 'package:flutter/material.dart';
import 'package:invoice_genretor/pages/pdfPage/pdfPage.dart';
import 'package:invoice_genretor/utils/Routes_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.pdfpage);
        },
        label: const Text("Get Pdf"),
        icon: const Icon(Icons.picture_as_pdf_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              MyRoutes.invoice,
            );
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Container(
              height: size.height * 0.2,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3, 3),
                    blurRadius: 5,
                  ),
                ],
                color: Color(0xffEE9322),
              ),
              alignment: Alignment.center,
              child: const Text(
                "+ Creat New invoice ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

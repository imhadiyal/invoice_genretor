import 'package:flutter/material.dart';
import 'package:invoice_genretor/utils/Routes_utils.dart';

class InvoiceGenerater extends StatefulWidget {
  const InvoiceGenerater({super.key});

  @override
  State<InvoiceGenerater> createState() => _InvoiceGeneraterState();
}

class _InvoiceGeneraterState extends State<InvoiceGenerater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("invoice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            children: allinvoiceOptions
                .map((e) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, e['route']);
                      },
                      child: Card(
                        shadowColor: Colors.grey,
                        elevation: 3,
                        margin: const EdgeInsets.all(10),
                        shape: OutlineInputBorder(
                          gapPadding: 10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(
                            e['title'],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}

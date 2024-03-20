import 'package:flutter/material.dart';
import 'package:invoice_genretor/pages/InvoiceGenerator/collection/footerPage.dart';
import 'package:invoice_genretor/pages/pdfPage/pdfPage.dart';
import 'package:invoice_genretor/pages/InvoiceGenerator/collection/productPage.dart';
import 'package:invoice_genretor/pages/splashScreen/splashScreen.dart';

import '../pages/InvoiceGenerator/collection/headarPage.dart';
import '../pages/InvoiceGenerator/invoice_generator.dart';
import '../pages/homepage/home_page.dart';

class MyRoutes {
  static String splashScreen = '/';
  static String homepage = 'home_page';
  static String invoice = 'invoice_generator';
  static String pdfpage = 'pdf_page';

  //Routes
  static Map<String, WidgetBuilder> routes = {
    MyRoutes.splashScreen: (context) => SplashScreen(),
    MyRoutes.homepage: (context) => HomePage(),
    MyRoutes.invoice: (context) => InvoiceGenerater(),
    MyRoutes.pdfpage: (context) => PdfPage(),
    allinvoiceOptions[0]['route']: (context) => FooterPage(),
    allinvoiceOptions[1]['route']: (context) => HeadarPage(),
    allinvoiceOptions[2]['route']: (context) => ProductOptionPage(),
  };
}

List allinvoiceOptions = [
  {
    'title': 'FooterPage',
    'route': 'footer_page',
  },
  {
    'title': 'HeaderPage',
    'route': 'header_page',
  },
  {
    'title': 'ProductPage ',
    'route': 'product_page',
  },
];

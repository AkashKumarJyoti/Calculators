import 'package:flutter/material.dart';
import 'currency_converter/ui/home.dart';
import 'first_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Intro(),
    // home: BillSplitter(),
  ));
}

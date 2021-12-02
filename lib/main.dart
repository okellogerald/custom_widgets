import 'package:custom_widgets/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Hermit',
          primaryColor: const Color(0xff054DBC),
          backgroundColor: const Color(0xffEBECF1),
          focusColor: const Color(0xff8BA2D6)
        ),
        home: const MainPage());
  }
}

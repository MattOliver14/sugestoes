import 'package:flutter/material.dart';
import 'view/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor:  Color(0xFF5fa7b3)),
          primaryColor: Color(0xFF5fa7b3)),*/
      home: HomePage(),
    );
  }
}

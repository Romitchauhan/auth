import 'package:flutter/material.dart';

import 'auth.dart';
 void main ()=> runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "Finger Print Auth",
     debugShowCheckedModeBanner: false,
     home: HomePage(),
   );
  }
}
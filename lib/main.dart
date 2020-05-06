import 'package:flutter/material.dart';
import 'DealPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(bottom:38),
      child: MaterialApp(
        title: 'Best deals forever',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: DealPage(),
      ),
    );
  }
}



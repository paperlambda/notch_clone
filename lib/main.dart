import 'package:flutter/material.dart';
import 'package:notch_clone/core/constants.dart';
import 'package:notch_clone/ui/router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: homeRoute,
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/login_screen.dart';




class HrcpdApp extends StatelessWidget {
  const HrcpdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HRCPD',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          ),
      home: LoginScreen(),
    );
  }
}

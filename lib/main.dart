import 'package:flutter/material.dart';
import 'package:opd_app/screens/change_language.dart';
import 'package:opd_app/screens/legal_desc/privacy_screen.dart';
import 'package:opd_app/screens/legal_desc/terms_screen.dart';
import 'package:opd_app/screens/login.dart';
import 'package:opd_app/screens/patient_details.dart';
import 'package:opd_app/screens/doctor_profile.dart';
import 'package:opd_app/screens/register.dart';
import 'package:opd_app/screens/verify_phone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OPD Appointment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

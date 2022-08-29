import 'package:flutter/material.dart';
import 'package:opd_app/screens/change_language.dart';
import 'package:opd_app/screens/departments_screen.dart';
import 'package:opd_app/screens/doctor_profile.dart';
import 'package:opd_app/screens/faq_screen.dart';
import 'package:opd_app/screens/home_screen.dart';
import 'package:opd_app/screens/legal_desc/privacy_screen.dart';
import 'package:opd_app/screens/legal_desc/terms_screen.dart';
import 'package:opd_app/screens/login.dart';
import 'package:opd_app/screens/register.dart';
import 'package:opd_app/screens/verify_phone.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool(prefLoggedIn);

    if (loggedIn == true) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // Obtain shared preferences.
    final isLogedin = isLoggedIn();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OPD Appointment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TermsScreen(),
      // home: FaqScreen(),
      // home: DepartmentsScreen(userType: UserType.admin),
      // home: FutureBuilder(
      //   future: isLogedin,
      //   builder: (context, snapshot) {
      //     if (snapshot.data == true) {
      //
      //       return const PatientDashboardScreen();
      //     } else {
      //       return const LoginScreen();
      //     }
      //   },
      // ),
    );
  }
}

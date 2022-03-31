import 'package:flutter/material.dart';
import 'package:opd_app/screens/login.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({Key? key, required this.selectedIndex})
      : super(key: key);
  static const gray = Color(0xFFB1B1B3);
  static const blue = Color(0xFF005F8F);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: blue,
      unselectedItemColor: gray,
      currentIndex: selectedIndex,
      items: [
        buildBottomNavigationBarItem(
          context,
          Icons.home,
          const LoginScreen(),
        ),
        buildBottomNavigationBarItem(
          context,
          Icons.lock_clock,
          const LoginScreen(),
        ),
        buildBottomNavigationBarItem(
          context,
          Icons.notifications_none,
          const LoginScreen(),
        ),
        buildBottomNavigationBarItem(
          context,
          Icons.assignment,
          const LoginScreen(),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      BuildContext context, IconData icon, Widget destination) {
    return BottomNavigationBarItem(
      icon: IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => destination,
            ),
          );
        },
        icon: Icon(
          icon,
        ),
      ),
      label: "",
    );
  }
}

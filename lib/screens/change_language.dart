import 'package:flutter/material.dart';
import 'package:opd_app/constants.dart';
import 'package:opd_app/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:opd_app/screens/doctor_profile.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  static const blue = Color(0xFF005F8F);
  static const selectedCardColor = Color(0xFFF5FCFF);
  static const gray = Color(0xFFB1B1B3);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      centerTitle: true,
      toolbarHeight: 100,
      backgroundColor: Colors.white.withOpacity(0),
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20,
        ),
      ),
      title: const Text(
        "Change Language",
        style: black19w400,
      ),
    );
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: const CustomBottomNavBar(
        selectedIndex: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 30),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              mainAxisSpacing: 23,
              crossAxisSpacing: 18,
              childAspectRatio: 1.5,
              children: [
                buildLanguageCard(),
                buildUnselectedLanguageCard("Hindi", "हिंदी"),
                buildUnselectedLanguageCard("Bangla", "বাংলা"),
                buildUnselectedLanguageCard("Odia", "ଓଡିଆ"),
                buildUnselectedLanguageCard("Marathi", "मराठी"),
                buildUnselectedLanguageCard("Malayalam", "മലയാളംs"),
                buildUnselectedLanguageCard("Kannada", "ಕನ್ನಡ"),
                buildUnselectedLanguageCard("Tamil", "தமிழ்"),
              ],
            ),
          ),
          Expanded(child: Container()),
          buildCustomBtn()
        ],
      ),
    );
  }

  Container buildCustomBtn() {
    return Container(
      width: double.infinity,
      height: 45,
      margin: const EdgeInsets.only(bottom: 12, left: 40, right: 40),
      decoration: const BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        },
        borderRadius: BorderRadius.circular(5),
        child: const Center(
          child: Text(
            "Continue",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Card buildUnselectedLanguageCard(String languageName, String languageSymbol) {
    return Card(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: gray,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 13,
              left: 7,
              child: Text(
                languageName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              top: 42,
              left: 8,
              child: Text(
                languageSymbol,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              right: 10,
              child: Radio(
                value: "English",
                onChanged: (String? x) {
                  print(x);
                },
                groupValue: "language",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildLanguageCard() {
    return Card(
      color: selectedCardColor,
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: blue,
          ),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 13,
              left: 7,
              child: Text(
                "English",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              right: 10,
              child: Radio(
                value: "English",
                onChanged: (String? x) {
                  print(x);
                },
                groupValue: "language",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

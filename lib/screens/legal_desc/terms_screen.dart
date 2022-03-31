import 'package:flutter/material.dart';
import 'package:opd_app/constants.dart';
import 'package:opd_app/custom_widgets/custom_bottom_navigation_bar.dart';


class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  static const gray = Color(0xFFB1B1B3);
  static const blue = Color(0xFF005F8F);
  static const dividerGray = Color(0xFFE3E3E3);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      centerTitle: true,
      toolbarHeight: 100,
      backgroundColor: Colors.white.withOpacity(0),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20,
        ),
      ),
      title: const Text(
        "Terms and conitions",
        style: black19w400,
      ),
    );
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: const CustomBottomNavBar(
        selectedIndex: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Image.asset(
                  "assets/images/terms.png",
                  width: 220,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              buildTermsHeading("Terms of Services"),
              const SizedBox(height: 9),
              buildPrivacyParagraph(
                "The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content.The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content.",
              ),
              const SizedBox(height: 16),
              buildTermsHeading("Terms of Payments"),
              const SizedBox(height: 9),
              buildPrivacyParagraph(
                "The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content.The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildPrivacyParagraph(String privacy) {
    return Text(
      privacy,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Text buildTermsHeading(String heading) {
    return Text(
      heading,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}


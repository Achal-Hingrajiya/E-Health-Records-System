import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:opd_app/constants.dart';
import 'package:opd_app/screens/change_language.dart';
import 'package:opd_app/screens/legal_desc/privacy_screen.dart';
import 'package:opd_app/screens/legal_desc/terms_screen.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
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
        "Patient Details",
        style: black19w400,
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildField("GOVT. ID", "Select ID"),
                sizedBoxH20W0,
                buildField("ID no.", "Enter ID no."),
                sizedBoxH20W0,
                buildField("Date of birth", "DD/MM/YYYY"),
                sizedBoxH20W0,
                buildTextArea("Address", "Enter your address"),
                sizedBoxH20W0,
                Row(
                  children: [
                    Expanded(
                      child: buildField("City", "Select city"),
                    ),
                    sizedBoxH0W12,
                    Expanded(
                      child: buildField("State", "Select state"),
                    )
                  ],
                ),
                sizedBoxH20W0,
                buildField("Pincode", "Enter your pincode"),
                sizedBoxH50W0,
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (choice) {}),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            buildFooterTextSpan(
                                "By checking this box, you are agree to our ",
                                gray),
                            buildClickableFooterTextSpan(
                              "Terms & Conditions",
                              primaryColor,
                              const TermsScreen(),
                            ),
                            buildFooterTextSpan(" and ", gray),
                            buildClickableFooterTextSpan(
                              "Privacy Policy",
                              primaryColor,
                              const PrivacyScreen(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                sizedBoxH8W0,
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ChangeLanguageScreen(),
                            ),
                          );
                        },
                        child: const Text("Verify ID and submit details"),
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          fixedSize: const Size(
                            double.infinity,
                            45,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextSpan buildFooterTextSpan(String txt, Color color) {
    return TextSpan(
      text: txt,
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  TextSpan buildClickableFooterTextSpan(
      String txt, Color color, Widget destination) {
    return TextSpan(
      text: txt,
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => destination),
          );
        },
    );
  }

  Column buildTextArea(String title, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: black12w500,
        ),
        sizedBoxH8W0,
        TextFormField(
          maxLines: 5,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15, top: 20),
            hintText: placeholder,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              borderSide: BorderSide(
                color: gray,
                width: 1,
              ),
            ),
          ),
        )
      ],
    );
  }

  Column buildField(String title, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: black12w500,
        ),
        sizedBoxH8W0,
        Container(
          height: 38,
          child: TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15),
              hintText: placeholder,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                borderSide: BorderSide(
                  color: gray,
                  width: 1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

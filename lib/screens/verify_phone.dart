import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:opd_app/constants.dart';
import 'package:opd_app/screens/home_screen.dart';
import 'package:opd_app/screens/patient_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyPhoneScreen extends StatefulWidget {
  final String mobileNo;

  final LoginOrRegister loginOrRegister;

  const VerifyPhoneScreen(
      {Key? key,
      required LoginOrRegister this.loginOrRegister,
      required String this.mobileNo})
      : super(key: key);

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  Future<bool> verifyOTP(String otp) async {
    try {
      final response = await http.post(
        Uri.parse("$url/verify_otp"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"mobile": "${widget.mobileNo}", "otp": "$otp"}),
      );
      final jsonData = jsonDecode(response.body);

      print(response.statusCode);

      return response.statusCode == 202;
    } catch (err) {
      print("Error occurred: $err");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();

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
        "Verify Phone",
        style: black19w400,
      ),
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar,
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBoxH20W0,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "OTP sent to ",
                    style: black14w400,
                  ),
                  Text(
                    "+91${widget.mobileNo}",
                    style: black14w500,
                  )
                ],
              ),
              sizedBoxH50W0,
              Container(
                height: 40,
                child: TextFormField(
                  maxLines: 1,
                  controller: otpController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15),
                    hintText: "Enter OTP",
                    border: OutlineInputBorder(
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
              ),
              sizedBoxH20W0,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final otp = otpController.text;
                        print("OTP: $otp");
                        final bool status = await verifyOTP(otp);
                        if (status) {
                          print("OTP verified successfully.");
                          // print("Login/Register: ${widget.loginOrRegister}");
                          // print("navigating ot dashboard");

                          if (widget.loginOrRegister == LoginOrRegister.login) {
                            print("navigating ot dashboard");
                            // Obtain shared preferences.
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool(prefLoggedIn, true);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PatientDashboardScreen(),
                              ),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PatientDetailsScreen(
                                  mobileNo: widget.mobileNo,
                                ),
                              ),
                            );
                          }
                        } else {
                          print("Nothing");
                        }
                      },
                      child: Text("Verify OTP"),
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
              sizedBoxH20W0,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't received OTP?"),
                  TextButton(
                    onPressed: () {},
                    child: Text("Resend OTP"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:opd_app/constants.dart';
import 'package:opd_app/screens/register.dart';
import 'package:opd_app/screens/verify_phone.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<bool> sendOTP(String mobileNo) async {
    try {
      final response = await http.post(
        Uri.parse("$url/login"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"mobile": "$mobileNo"}),
      );
      final jsonData = jsonDecode(response.body);

      print(jsonData);

      return response.statusCode == 200;
    } catch (err) {
      print("Error occurred: $err");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {



    final loginController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              Center(
                child: Image.asset(
                  "assets/images/login.png",
                  height: 300,
                  width: 300,
                ),
              ),
              sizedBoxH30W0,
              const Text(
                "Login",
                style: black22w600,
              ),
              sizedBoxH30W0,
              Container(
                height: 40,
                child: TextFormField(
                  maxLines: 1,
                  controller: loginController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15),
                    hintText: "Enter mobile no,",
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
                        var mobileNo = loginController.text;

                        print("Mobile No: $mobileNo");

                        final bool status = await sendOTP(mobileNo);
                        if (status) {
                          print("Success");

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VerifyPhoneScreen(
                                loginOrRegister: LoginOrRegister.login,
                                mobileNo: mobileNo,
                              ),
                            ),
                          );
                        } else {
                          print("Failed");
                        }
                      },
                      child: Text("Send OTP"),
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
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New user?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
              sizedBoxH30W0
            ],
          ),
        ),
      ),
    );
  }
}

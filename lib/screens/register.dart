import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:opd_app/constants.dart';
import 'package:opd_app/screens/login.dart';
import 'package:opd_app/screens/verify_phone.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Future<bool> register(String mobileNo, String name) async {
    try {
      final response = await http.post(
        Uri.parse("$url/register"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"mobile": "$mobileNo", "name": "$name"}),
      );
      final jsonData = jsonDecode(response.body);

      print(jsonData);

      return response.statusCode == 200;
    } catch (err) {
      print("Error occurred: $err");
      return false;
    }
  }

  final mobileController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22,
            ),
          ),
        ),
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
                "Register",
                style: black22w600,
              ),
              sizedBoxH30W0,
              Container(
                height: 40,
                child: TextFormField(
                  maxLines: 1,
                  controller: nameController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15),
                    hintText: "Enter name",
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
              Container(
                height: 40,
                child: TextFormField(
                  maxLines: 1,
                  controller: mobileController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15),
                    hintText: "Enter mobile no.",
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
              Expanded(child: Container()),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final String name = nameController.text;
                        final String mobileNo = mobileController.text;

                        final bool status = await register(mobileNo, name);
                        // print(status);

                        if (status) {
                          print("Navigating to details");

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VerifyPhoneScreen(
                                loginOrRegister: LoginOrRegister.register,
                                mobileNo: mobileNo,
                              ),
                            ),
                          );
                        } else {
                          print("Registration failed");
                        }
                      },
                      child: const Text("Send OTP"),
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
              Expanded(child: Container()),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already registered?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: const Text("Login"),
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

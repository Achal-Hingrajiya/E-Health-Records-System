import 'package:flutter/material.dart';
import 'package:opd_app/constants.dart';
import 'package:opd_app/screens/register.dart';
import 'package:opd_app/screens/verify_phone.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VerifyPhoneScreen(),
                          ),
                        );
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

import 'package:flutter/material.dart';
import 'package:opd_app/constants.dart';

class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({Key? key}) : super(key: key);

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
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
                children: const [
                  Text(
                    "OTP sent to ",
                    style: black14w400,
                  ),
                  Text(
                    "+6355689874",
                    style: black14w500,
                  )
                ],
              ),
              sizedBoxH50W0,
              Container(
                height: 40,
                child: TextFormField(
                  maxLines: 1,
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
                      onPressed: () {},
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

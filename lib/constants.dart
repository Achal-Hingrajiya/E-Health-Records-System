import 'package:flutter/material.dart';

const primaryColor = Color(0xFF005F8F);
const gray = Color(0xFFA0A0A0);

const url = "http://192.168.17.100:8000/api";

enum LoginOrRegister{
  login,
  register
}

enum UserType{
  patient,
  doctor,
  admin
}
const prefLoggedIn = "loggedIn";
const prefMobile = "mobile";

const gray13w300 = TextStyle(
  fontSize: 13,
  color: gray,
  fontWeight: FontWeight.w300,
);

const black12w400 = TextStyle(
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);


const black12w500 = TextStyle(
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

const black14w400 = TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

const black14w500 = TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

const black14w600 = TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

const black19w400 = TextStyle(
  fontSize: 19,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

const black21w400 = TextStyle(
  fontSize: 21,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

const black22w600 = TextStyle(
  fontSize: 22,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

const white18w700 = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);


const sizedBoxH3W0 = SizedBox(
  height: 3,
);

const sizedBoxH8W0 = SizedBox(
  height: 8,
);

const sizedBoxH0W12 = SizedBox(
  width: 12,
);

const sizedBoxH20W0 = SizedBox(
  height: 20,
);

const sizedBoxH30W0 = SizedBox(
  height: 30,
);

const sizedBoxH40W0 = SizedBox(
  height: 40,
);

const sizedBoxH50W0 = SizedBox(
  height: 50,
);


import 'package:flutter/material.dart';

// text style
const appBarButton = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 17.0,
    fontWeight: FontWeight.w700,
    color: Colors.white);
const appBarButtonBlue = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 17.0,
    fontWeight: FontWeight.w700,
    color: Color(0xFF018bf8));
const title = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: Color(0xFF333333));
const titleBig = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 17.0,
    fontWeight: FontWeight.w700,
    color: Color(0xFF333333));
const titleBlue = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: Color(0xFF018bf8));
const subtitle = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 12.5,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 71, 71, 71));
const subtitleGrey = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 158, 158, 158));
const normal = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: Color(0xFF333333));
const textPutih = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.white);

// button style
var mainElevatedBtnStyle = ElevatedButton.styleFrom(
  primary: const Color(0xFF018bf8),
  padding: const EdgeInsets.symmetric(vertical: 16.0),
);
var secondaryElevatedBtnStyle = ElevatedButton.styleFrom(
  primary: Colors.white,
);

final smallOutlinedBtnStyle = OutlinedButton.styleFrom(
  fixedSize: const Size(100, 40),
  textStyle: const TextStyle(
    fontFamily: 'Rubik',
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),
  side: const BorderSide(
    width: 1.0,
    color: Colors.white,
  ),
  padding: const EdgeInsets.all(2),
);

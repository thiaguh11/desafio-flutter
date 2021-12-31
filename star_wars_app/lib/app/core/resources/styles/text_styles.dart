import 'package:flutter/material.dart';

abstract class TextStyles {
  static const title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  
  static const label = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
  
  static const subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}

import 'package:flutter/material.dart';

Color selectedColor = const Color(0xFFFFDD5E);
Color unselectedColor = Colors.white;
Color getActiveColor(int index, int selectedIndex) {
  if (index == selectedIndex) {
    return selectedColor;
  }
  return unselectedColor;
}

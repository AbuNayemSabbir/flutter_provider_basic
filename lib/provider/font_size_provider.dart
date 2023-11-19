import 'package:flutter/material.dart';

class FontSizeProvider extends ChangeNotifier {
double textSize=16.0;

void setTextSize(double newSize) {
  textSize=newSize;
  notifyListeners();
}

}
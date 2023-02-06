import 'package:flutter/material.dart';

extension PageNavigator on BuildContext {
  void next(T) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => T));
  }

  void nextRemove(T) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(
          builder: (context) => T,
        ),
        (route) => false);
  }
}

extension StringFormat on String {
  String toAssetImage() {
    return "assets/images/$this";
  }
}

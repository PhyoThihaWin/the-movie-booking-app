import 'dart:ffi';

import 'package:flutter/material.dart';

/// Context Extension
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

  double getScreenHeightBy(double times) {
    return MediaQuery.of(this).size.height / times;
  }

  double getScreenWidthBy(double times) {
    return MediaQuery.of(this).size.width / times;
  }
}

/// String Extension
extension StringFormat on String {
  String toAssetImage() {
    return "assets/images/$this";
  }

  String toAssetIcon() {
    return "assets/icons/$this";
  }
}

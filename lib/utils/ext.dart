import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moviebooking/resource/dimens.dart';

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

  void popBack() {
    Navigator.pop(this);
  }

  double getScreenHeightBy(double times) {
    return MediaQuery.of(this).size.height / times;
  }

  double getScreenWidthBy(double times) {
    return MediaQuery.of(this).size.width / times;
  }

  /// loading dialog
  showLoaderDialog() {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(
                left: MARGIN_LARGE,
              ),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: this,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

/// String Extension
extension StringFormat on String {
  String toAssetImage() => "assets/images/$this";

  String toAssetIcon() => "assets/icons/$this";

  String formatDate({
    String parseFormat = "yyyy-MM-dd",
    required String format,
  }) {
    DateTime parseDate = DateFormat(parseFormat).parse(this);
    var resultFormat = DateFormat(format);
    return resultFormat.format(parseDate);
  }

}

extension NullIntExtension on int? {
  int get orZero => this ?? 0;
}

extension NullDoubleExtension on double? {
  double get orZero => this ?? 0;
}

extension NullBoolExtension on bool? {
  bool get orTrue => this ?? true;

  bool get orFalse => this ?? false;
}

extension ListNullSafetyExtension<T> on List<T?>? {
  List<T?> get orEmpty => this ?? [];

  List<T> get orEmptyObject =>
      this?.where((element) => element != null).toList().cast() ?? [];
}

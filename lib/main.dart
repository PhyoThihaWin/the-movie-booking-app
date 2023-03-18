import 'package:flutter/material.dart';
import 'package:moviebooking/data/model/movie_booking_model_impl.dart';
import 'package:moviebooking/page/auth/verify_phone_page.dart';
import 'package:moviebooking/resource/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        primaryColor: PRIMARY_COLOR,
        primarySwatch: PRIMARY_COLOR_MATERIAL,
      ),
      home: VerifyPhonePage(),
    );
  }
}

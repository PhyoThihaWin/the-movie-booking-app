import 'package:flutter/material.dart';
import 'package:moviebooking/page/auth/verify_phone_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';

import '../resource/dimens.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      context.nextRemove(const VerifyPhonePage());
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SplashLogoView(),
              SizedBox(height: MARGIN_MEDIUM),
              SplashTitleView()
            ],
          ),
        ),
      ),
    );
  }
}

class SplashTitleView extends StatelessWidget {
  const SplashTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
              text: 'C',
              style: TextStyle(
                  fontSize: TEXT_REGULAR_3X,
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: ' cinema  ',
              style: TextStyle(
                  color: TEXT_GREY_COLOR,
                  fontSize: TEXT_REGULAR_3X,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class SplashLogoView extends StatelessWidget {
  const SplashLogoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "movie_booking_logo.png".toAssetImage(),
      width: SPLASH_SCREEN_LOGO_WIDTH,
    );
  }
}

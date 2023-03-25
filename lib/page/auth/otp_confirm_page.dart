import 'dart:math';

import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/page/auth/pick_region_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../data/model/movie_booking_model.dart';
import '../../data/model/movie_booking_model_impl.dart';
import '../../resource/dimens.dart';
import '../../resource/strings.dart';
import '../../widget/cinema_logo_view.dart';
import '../../widget/policy_text_btm_view.dart';

class OtpConfirmPage extends StatelessWidget {
  final MovieBookingModel movieBookingModel = MovieBookingModelImpl();
  final String phoneNumber;

  OtpConfirmPage({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          color: HOME_SCREEN_BACKGROUND_COLOR,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: OtpConfirmContentSection(onClick: (otpCode) {
                    if (otpCode.length == 6) {
                      context.showLoaderDialog();
                      movieBookingModel
                          .signInWithPhone(phoneNumber, otpCode)
                          .then((value) {
                        if (value != null) {
                          movieBookingModel.saveUserDataToDb(value);
                        }
                        Navigator.pop(context);
                        if (value != null) context.next(PickRegionPage());
                      }).catchError((error) {
                        Navigator.pop(context);
                        debugPrint(error.toString());
                      });
                    }
                  }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MARGIN_MEDIUM_2,
                  horizontal: MARGIN_LARGE,
                ),
                child: PolicyTextBottomView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpConfirmContentSection extends StatelessWidget {
  final OtpFieldController otpController = OtpFieldController();
  String? otpCode;
  final Function(String) onClick;

  OtpConfirmContentSection({required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: MARGIN_LARGE),
        CinemaLogoView(),
        const SizedBox(height: VERIFY_SCREEN_LOGO_TEXT_HEIGHT),
        const OtpCodeTitleView(),
        const SizedBox(
          height: VERIFY_SCREEN_LOGO_TEXT_HEIGHT,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_LARGE,
          ),
          child: OtpBoxFieldView(otpController, (String pin) => otpCode = pin),
        ),
        SizedBox(height: MARGIN_XLARGE),
        ResendOtpCodeView(),
        SizedBox(height: MARGIN_XLARGE + MARGIN_MEDIUM),
        ConfirmOtpBtnView(() {
          onClick(otpCode.orEmpty);
        }),
      ],
    );
  }
}

class ConfirmOtpBtnView extends StatelessWidget {
  final Function confirmOTP;

  ConfirmOtpBtnView(this.confirmOTP);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: VERIFY_BTN_HEIGHT,
      margin: EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
      child: ElevatedButton(
        onPressed: () {
          confirmOTP.call();
        },
        child: Text(
          CONFIRM_OTP_TEXT,
          style: TextStyle(color: Colors.black),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(PRIMARY_COLOR),
        ),
      ),
    );
  }
}

class ResendOtpCodeView extends StatelessWidget {
  const ResendOtpCodeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          DONT_RECEIVED_OTP_CODE_TEXT,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          RESEND_OTP_CODE_TEXT,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

class OtpBoxFieldView extends StatelessWidget {
  final OtpFieldController otpController;
  final void Function(String) setOtpCode;

  OtpBoxFieldView(this.otpController, this.setOtpCode);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          ENTER_OTP_CODE,
          style: TextStyle(
            color: TEXT_GREY_COLOR,
            fontSize: TEXT_REGULAR,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Center(
          child: OTPTextField(
              controller: otpController,
              length: 6,
              keyboardType: TextInputType.number,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: MediaQuery.of(context).size.width / 8,
              fieldStyle: FieldStyle.box,
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: Colors.white,
              ),
              outlineBorderRadius: MARGIN_SMALL,
              style: const TextStyle(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600,
              ),
              onChanged: (pin) {
                print("Changed: " + pin);
              },
              onCompleted: (pin) {
                print("Completed: " + pin);
                setOtpCode(pin);
              }),
        ),
      ],
    );
  }
}

class OtpCodeTitleView extends StatelessWidget {
  const OtpCodeTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          SEND_OTP_CODE_TITLE,
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_4X,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Text(
          SEND_OTP_CODE_DESC,
          style: TextStyle(
            color: TEXT_GREY_COLOR,
            fontSize: TEXT_REGULAR,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

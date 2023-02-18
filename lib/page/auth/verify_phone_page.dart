import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/page/auth/otp_confirm_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/strings.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../../resource/dimens.dart';
import '../../widget/cinema_logo_view.dart';
import '../../widget/policy_text_btm_view.dart';

class VerifyPhonePage extends StatelessWidget {
  const VerifyPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          color: HOME_SCREEN_BACKGROUND_COLOR,
          child: Column(
            children: const [
              Expanded(
                child: SingleChildScrollView(
                  child: InputContentSection(),
                ),
              ),
              Padding(
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

class InputContentSection extends StatefulWidget {
  const InputContentSection({
    Key? key,
  }) : super(key: key);

  @override
  State<InputContentSection> createState() => _InputContentSectionState();
}

class _InputContentSectionState extends State<InputContentSection> {
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: MARGIN_LARGE),
        CinemaLogoView(),
        const SizedBox(height: VERIFY_SCREEN_LOGO_TEXT_HEIGHT),
        const VerifyPhoneTitleView(),
        const SizedBox(
          height: VERIFY_SCREEN_LOGO_TEXT_HEIGHT,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
          child: PhoneNumberInputSection(_phoneController),
        ),
        const SizedBox(height: MARGIN_XXLARGE),
        VerifyPhoneButtonView(() {
          if (_phoneController.value.text.isNotEmpty &&
              _phoneController.value.text.length > 9) {
            context.next(const OtpConfirmPage());
          }
        }),
        const SizedBox(height: MARGIN_MEDIUM_3),
        const DividerTextView(),
        const SizedBox(height: MARGIN_MEDIUM_3),
        const ContinueGoogleButtonView(),
        const SizedBox(height: MARGIN_MEDIUM_3),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }
}

class ContinueGoogleButtonView extends StatelessWidget {
  const ContinueGoogleButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: VERIFY_BTN_HEIGHT,
      margin: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
      child: ElevatedButton(
        onPressed: () => context.next(const OtpConfirmPage()),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "google_icon.png".toAssetIcon(),
              width: MARGIN_LARGE,
            ),
            const SizedBox(width: MARGIN_MEDIUM_2),
            const Text(
              CONTINUE_WITH_GOOGLE_BTN_TEXT,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class DividerTextView extends StatelessWidget {
  const DividerTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MARGIN_LARGE,
            ),
            child: Divider(
              color: TEXT_GREY_COLOR,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            color: HOME_SCREEN_BACKGROUND_COLOR,
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_LARGE,
              vertical: MARGIN_MEDIUM,
            ),
            child: const Text(
              "or",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class VerifyPhoneButtonView extends StatelessWidget {
  final void Function() verifyPhoneNumber;

  VerifyPhoneButtonView(this.verifyPhoneNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: VERIFY_BTN_HEIGHT,
      margin: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
      child: ElevatedButton(
        onPressed: verifyPhoneNumber,
        child: const Text(
          VERIFY_PHONE_NUMBER_BUTTON_TEXT,
          style: const TextStyle(color: Colors.black),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(PRIMARY_COLOR),
        ),
      ),
    );
  }
}

class PhoneNumberInputSection extends StatelessWidget {
  final TextEditingController phoneController;

  PhoneNumberInputSection(this.phoneController);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CountryCodeView(),
        const SizedBox(width: MARGIN_LARGE),
        Expanded(
          child: MobileNumberView(phoneController),
        )
      ],
    );
  }
}

class VerifyPhoneTitleView extends StatelessWidget {
  const VerifyPhoneTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          VERIFY_PHONE_NUMBER,
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_4X,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Text(
          SEND_SMS_CODE_TO_VERIFY_PHONE,
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

class MobileNumberView extends StatelessWidget {
  final TextEditingController phoneController;

  MobileNumberView(this.phoneController);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: phoneController,
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          hintText: MOBILE_NUMBER_TEXT,
          hintStyle: TextStyle(
            color: TEXT_GREY_COLOR,
          ),
          fillColor: Colors.white,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ));
  }
}

class CountryCodeView extends StatefulWidget {
  @override
  State<CountryCodeView> createState() => _CountryCodeViewState();
}

class _CountryCodeViewState extends State<CountryCodeView> {
  String? _countryCode;

  @override
  void initState() {
    initCountry();
    super.initState();
  }

  void initCountry() async {
    final country = await getCountryByCountryCode(context, "MM");
    setState(() {
      _countryCode = country?.callingCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    _controller.text = '${_countryCode} ';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          COUNTRY_CODE,
          style: TextStyle(
            color: TEXT_GREY_COLOR,
            fontSize: TEXT_SMALL,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 5,
          child: TextField(
            onTap: _showCountryPicker,
            readOnly: true,
            controller: _controller,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              isDense: true,
              // Added this
              contentPadding: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM),
              suffixIcon: Icon(
                Icons.keyboard_arrow_down,
                color: TEXT_GREY_COLOR,
              ),
              suffixIconConstraints: BoxConstraints(
                minWidth: MARGIN_LARGE,
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: PRIMARY_COLOR)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showCountryPicker() async {
    final country = await showCountryPickerSheet(context,
        title: const Text(
          "Choose Country",
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_HEADING_1X,
            fontWeight: FontWeight.w700,
          ),
        ),
        cancelWidget: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(
              right: MARGIN_MEDIUM_3,
            ),
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                context.popBack();
              },
            ),
          ),
        ));
    if (country != null) {
      setState(() {
        _countryCode = country.callingCode;
      });
    }
  }
}

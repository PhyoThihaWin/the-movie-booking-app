import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../data/model/vos/setting.dart';
import '../../viewitem/setting_item_view.dart';

class ProfilePage extends StatelessWidget {
  final List<Setting> settingList = [
    Setting(name: "Purchase History", image: "ic_purchase_history.png"),
    Setting(name: "Offer", image: "ic_offer.png"),
    Setting(name: "Gift Card", image: "ic_gift_card_fill.png"),
    Setting(name: "Location", image: "ic_location_setting.png"),
    Setting(name: "Payment", image: "ic_payment.png"),
    Setting(name: "Help and Support", image: "ic_support.png"),
    Setting(name: "Logout", image: "ic_logout.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HOME_SCREEN_BACKGROUND_COLOR,
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _ProfileLoginSignUpSection(),
            ListView.builder(
              itemCount: settingList.length,
              padding: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SettingItemView(
                  settingList[index], index == settingList.length - 1),
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileLoginSignUpSection extends StatelessWidget {
  const _ProfileLoginSignUpSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          "img_profile_background.png".toAssetImage(),
          fit: BoxFit.cover,
        )),
        SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: MARGIN_LARGE),
              Image.asset(
                "img_profile_icon.png".toAssetImage(),
                width: MARGIN_XXLARGE * 2,
              ),
              SizedBox(height: MARGIN_MEDIUM_2),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: PRIMARY_COLOR, width: 2),
                    borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
                padding: EdgeInsets.symmetric(
                  vertical: MARGIN_MEDIUM,
                  horizontal: MARGIN_XLARGE,
                ),
                child: Text(
                  "Login or Sign Up",
                  style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: MARGIN_XXLARGE),
            ],
          ),
        )
      ],
    );
  }
}

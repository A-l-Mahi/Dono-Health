import 'package:donohealth/insurer_vendor_screen.dart';
import 'package:donohealth/vendor/screens/vendor_home_screen.dart';
import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'configs/SizeConfig.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = "/onboardingScreen";
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    void _onIntroEnd(context) {
      Navigator.of(context).pushNamed(InsurerVendorScreen.routeName);
    }

    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).primaryColor),
      bodyTextStyle: const TextStyle(
        fontSize: 18.0,
        color: Color(0xff14227f),
      ),
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.safeBlockVertical * 10,
          ),
          child: Center(
              child: _buildImage(
            'images/logo.png',
            SizeConfig.safeBlockHorizontal * 60,
          )),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Insurance Wallet",
          body:
              "A convient process to create and deposit to the insurance wallet",
          image: _buildImage(
            'images/onboard1.png',
            SizeConfig.safeBlockHorizontal * 80,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Withdrawal",
          body:
              "The process of verification and withdrawal from a patients wallet made by the hospital is more efficient",
          image: _buildImage(
            'images/onboard2.png',
            SizeConfig.safeBlockHorizontal * 80,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Voucher Card Feature",
          body:
              "Crediting a wallet is convinient using the voucher card feature",
          image: _buildImage(
            'images/onboard3.png',
            SizeConfig.safeBlockHorizontal * 80,
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 0,
      showBackButton: false,
      back: const Icon(Icons.arrow_back),
      overrideNext: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              'Next',
              style: TextStyle(fontSize: 20),
            ),
            Icon(Icons.arrow_forward_outlined)
          ],
        ),
        style: ElevatedButton.styleFrom(
          elevation: 5,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      done: ElevatedButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();

          final String? userType = prefs.getString('userType');
          final String? email = prefs.getString('email');

          if (userType == null || email == null) {
            Navigator.of(context).pushNamed(InsurerVendorScreen.routeName);
          }

          if (userType == "vendor") {
            Navigator.of(context)
                .pushReplacementNamed(VendorHomeScreen.routeName);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              'Let\'s go',
              style: TextStyle(fontSize: 20),
            ),
            Icon(Icons.arrow_forward_outlined)
          ],
        ),
        style: ElevatedButton.styleFrom(
          elevation: 5,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

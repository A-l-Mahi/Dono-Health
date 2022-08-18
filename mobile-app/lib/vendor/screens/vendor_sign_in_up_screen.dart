import 'package:donohealth/vendor/screens/vendor_sign_in_screen.dart';
import 'package:donohealth/vendor/screens/vendor_sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../configs/CustomClipPath.dart';
import '../../configs/SizeConfig.dart';

class VendorSignInUpScreen extends StatefulWidget {
  const VendorSignInUpScreen({Key? key}) : super(key: key);
  static const routeName = "/vendorSignInUpScreen";

  @override
  State<VendorSignInUpScreen> createState() => _VendorSignInUpScreenState();
}

class _VendorSignInUpScreenState extends State<VendorSignInUpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  alignment: Alignment.center,
                  color: const Color(0xffECF2F3),
                  height: SizeConfig.safeBlockVertical * 40,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                    width: SizeConfig.safeBlockHorizontal * 50,
                  ),
                ),
              ),
              Positioned(
                top: SizeConfig.safeBlockVertical * 25,
                child: Image.asset(
                  "assets/images/onboard1.png",
                  width: SizeConfig.safeBlockHorizontal * 100,
                ),
              )
            ],
          ),
          Container(),
          Container(),
          Container(),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 60,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(VendorSignInScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          Icon(Icons.arrow_forward_outlined,
                              color: Colors.white)
                        ]),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      side: BorderSide(
                          width: 1.5, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(VendorSignUpScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          Icon(Icons.arrow_forward_outlined)
                        ]),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      side: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(),
          Container()
        ],
      )),
    );
  }
}

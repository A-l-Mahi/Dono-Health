import 'package:donohealth/insurer/screens/insurer_sign_in_up_screen.dart';
import 'package:donohealth/vendor/screens/vendor_sign_in_up_screen.dart';
import 'package:flutter/material.dart';

import 'configs/SizeConfig.dart';

class InsurerVendorScreen extends StatefulWidget {
  static const routeName = "/insurerVendorScreen";
  const InsurerVendorScreen({Key? key}) : super(key: key);

  @override
  State<InsurerVendorScreen> createState() => _InsurerVendorScreenState();
}

class _InsurerVendorScreenState extends State<InsurerVendorScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
                color: const Color(0xffECF2F3),
                height: SizeConfig.safeBlockVertical * 35,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 60,
                    ),
                    child: Text(
                      'Continue as',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                  ),
                )),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 80,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(InsurerSignInUpScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Insurer',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          Icon(Icons.arrow_forward_outlined)
                        ]),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      side: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(VendorSignInUpScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Vendor',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          Icon(Icons.arrow_forward_outlined)
                        ]),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
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

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path0 = Path();

    path0.moveTo(size.width * 0.0033333, size.height * 0.0071429);
    path0.lineTo(size.width * 0.0041667, size.height * 0.6371429);
    path0.quadraticBezierTo(size.width * 0.1552167, size.height * 1.0059286,
        size.width * 0.2688750, size.height * 0.9837571);
    path0.quadraticBezierTo(size.width * 0.4965500, size.height * 0.8735286,
        size.width * 0.9966667, size.height * 0.6400000);
    path0.lineTo(size.width * 0.9975000, size.height * 0.0057143);
    path0.lineTo(size.width * 0.0033333, size.height * 0.0071429);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

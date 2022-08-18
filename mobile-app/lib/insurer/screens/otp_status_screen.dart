import 'package:donohealth/insurer/screens/insurer_home_screen.dart';
import 'package:flutter/material.dart';

import 'package:donohealth/insurer/configs/InsurerClipPath.dart';
import '../../configs/SizeConfig.dart';
import '../widgets/drawer.dart';

class OTPStatusScreen extends StatefulWidget {
  static const routeName = "/insurerOTPStatusScreen";
  const OTPStatusScreen({Key? key}) : super(key: key);

  @override
  State<OTPStatusScreen> createState() => _OTPStatusScreenState();
}

class _OTPStatusScreenState extends State<OTPStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: SafeArea(child: DonoDrawer()),
      body: Column(
        children: [
          ClipPath(
            clipper: InsurerClipPath(),
            child: Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              height: SizeConfig.safeBlockVertical * 20,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Premium Deposited',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
                width: SizeConfig.safeBlockHorizontal * 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/done.png',
                      width: SizeConfig.safeBlockHorizontal * 40,
                    ),
                    Text(
                      'You have successfully deposited N1000 to your wallet with ID',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 16),
                    ),
                    Text(
                      'DO1234568',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 20),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/pro.jpg',
                        width: SizeConfig.safeBlockHorizontal * 40,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: SizeConfig.safeBlockHorizontal * 60,
                            child: OutlinedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .pushNamed(OTPStatusScreen.routeName);
                              },
                              child: const Text(
                                'Save Card',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              ),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                side: BorderSide(
                                    width: 1.0,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 2),
                          Container(
                            width: SizeConfig.safeBlockHorizontal * 60,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(InsurerHomeScreen.routeName);
                              },
                              child: const Text(
                                'Home',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              ),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                side: BorderSide(
                                    width: 1.0,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

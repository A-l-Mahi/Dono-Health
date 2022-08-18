import 'package:donohealth/vendor/configs/VendorClipPath.dart';
import 'package:flutter/material.dart';

import '../../configs/SizeConfig.dart';

class VendorSettingsScreen extends StatefulWidget {
  const VendorSettingsScreen({Key? key}) : super(key: key);
  static const routeName = "/vendorSettingsScreen";

  @override
  State<VendorSettingsScreen> createState() => _VendorSettingsScreenState();
}

class _VendorSettingsScreenState extends State<VendorSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        elevation: 0,
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: VendorClipPath(),
            child: Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              height: SizeConfig.safeBlockVertical * 10,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Vendor Settings',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: SizeConfig.safeBlockVertical * 10,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: SizeConfig.safeBlockHorizontal * 60,
                  ),
                  Text(
                    'Version  1.0',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

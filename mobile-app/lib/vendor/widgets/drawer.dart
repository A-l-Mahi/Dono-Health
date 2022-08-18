import 'package:donohealth/insurer_vendor_screen.dart';
import 'package:donohealth/vendor/screens/vendor_home_screen.dart';
import 'package:donohealth/vendor/screens/vendor_profile_screen.dart';
import 'package:donohealth/vendor/screens/vendor_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/SizeConfig.dart';

class VendorDrawer extends StatelessWidget {
  const VendorDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: SizeConfig.safeBlockHorizontal * 60,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/mike.png',
                      width: 60,
                    )),
                ListTile(
                  title: const Text(
                    'Mike Dane',
                    textAlign: TextAlign.center,
                  ),
                  subtitle: const Text(
                    'mikedane@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Divider(),
                Text('VENDOR',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                Divider()
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading:
                      Icon(Icons.home, color: Theme.of(context).primaryColor),
                  title: Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(VendorHomeScreen.routeName);
                  },
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(VendorProfileScreen.routeName);
                  },
                  leading: Icon(Icons.account_circle_rounded,
                      color: Theme.of(context).primaryColor),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  ),
                  trailing: Icon(Icons.chevron_right,
                      color: Theme.of(context).primaryColor),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(VendorSettingsScreen.routeName);
                  },
                  leading: Icon(Icons.settings,
                      color: Theme.of(context).primaryColor),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  ),
                  trailing: Icon(Icons.chevron_right,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: OutlinedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();

                  prefs.remove('userType');
                  prefs.remove('email');

                  Navigator.of(context)
                      .pushReplacementNamed(InsurerVendorScreen.routeName);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Sign out',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      Icon(Icons.logout)
                    ]),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  side: BorderSide(
                      width: 1, color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

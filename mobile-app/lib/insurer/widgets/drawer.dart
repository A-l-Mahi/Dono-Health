import 'package:donohealth/insurer/screens/insurer_edit_profile.dart';
import 'package:donohealth/insurer/screens/insurer_home_screen.dart';
import 'package:donohealth/insurer/screens/insurer_settings_screen.dart';
import 'package:donohealth/insurer_vendor_screen.dart';
import 'package:flutter/material.dart';

import '../../configs/SizeConfig.dart';

class DonoDrawer extends StatelessWidget {
  const DonoDrawer({Key? key}) : super(key: key);

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
                      'assets/images/pro.jpg',
                      width: 60,
                    )),
                ListTile(
                  title: const Text(
                    'Suleiman Adamu',
                    textAlign: TextAlign.center,
                  ),
                  subtitle: const Text(
                    'adamufura98@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
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
                    Navigator.of(context)
                        .pushNamed(InsurerHomeScreen.routeName);
                  },
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(InsurerEditProfile.routeName);
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
                        .pushNamed(InsurerSettinsScreen.routeName);
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
                onPressed: () {
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

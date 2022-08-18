import 'package:donohealth/vendor/configs/VendorClipPath.dart';
import 'package:flutter/material.dart';

import '../../configs/SizeConfig.dart';

class VendorProfileScreen extends StatefulWidget {
  const VendorProfileScreen({Key? key}) : super(key: key);
  static const routeName = "/vendorProfileScreen";

  @override
  State<VendorProfileScreen> createState() => _VendorProfileScreenState();
}

class _VendorProfileScreenState extends State<VendorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Edit Profile')),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
            child: Column(
          children: [
            ClipPath(
              clipper: VendorClipPath(),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: const Color(0xffECF2F3),
                height: SizeConfig.safeBlockVertical * 30,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage('assets/images/mike.png'),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          bottom: 15,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_a_photo,
                              size: 35,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 80,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'First Name'),
                  ),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Middle Name')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Last Name')),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'Email')),
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Date Of Birth')),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'Gender')),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: SizeConfig.safeBlockHorizontal * 70,
              child: OutlinedButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed(InsurerHomeScreen.routeName);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      Icon(Icons.check, color: Colors.white)
                    ]),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  side: BorderSide(
                      width: 1.5, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

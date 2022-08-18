import 'dart:convert';

import 'package:donohealth/vendor/api/signInVendor.dart';
import 'package:donohealth/vendor/screens/vendor_home_screen.dart';
import 'package:flutter/material.dart';

import '../../configs/CustomClipPath.dart';
import '../../configs/SizeConfig.dart';
import '../api/createVendorSession.dart';

class VendorSignInScreen extends StatefulWidget {
  const VendorSignInScreen({Key? key}) : super(key: key);
  static const routeName = "/vendorSignInScreen";

  @override
  State<VendorSignInScreen> createState() => _VendorSignInScreenState();
}

class _VendorSignInScreenState extends State<VendorSignInScreen> {
  var isLoading = false;

  late TextEditingController emailTextController = TextEditingController();
  late TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
            child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                color: const Color(0xffECF2F3),
                height: SizeConfig.safeBlockVertical * 40,
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 60, left: 30),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Vendor',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
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
                    decoration:
                        const InputDecoration(labelText: 'Email Address'),
                  ),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'Password')),
                  TextButton(
                    onPressed: () {},
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 10,
            ),
            const SizedBox(height: 18),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: SizeConfig.safeBlockHorizontal * 70,
              child: OutlinedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  final result = await signInVendor(
                    email: emailTextController.text.trim(),
                    password: passwordTextController.text.trim(),
                  );

                  Map<String, dynamic> response = jsonDecode(result.body);

                  if (response['statusCode'] != 200) {
                    SnackBar snackBar = SnackBar(
                      content: Text(response['message']),
                    );
                    setState(() {
                      isLoading = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }

                  if (response['statusCode'] == 200) {
                    setState(() {
                      isLoading = false;
                    });
                    Map<String, dynamic> responseBody =
                        jsonDecode(response['body']);
                    print(responseBody);
                    createVendorSession(
                        userType: 'vendor', email: responseBody['email']);
                    Navigator.of(context)
                        .pushReplacementNamed(VendorHomeScreen.routeName);
                  }
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
                      Icon(Icons.arrow_forward_outlined, color: Colors.white)
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

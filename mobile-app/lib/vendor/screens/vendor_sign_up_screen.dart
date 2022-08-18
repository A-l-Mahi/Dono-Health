import 'dart:convert';

import 'package:donohealth/vendor/api/createVendorSession.dart';
import 'package:donohealth/vendor/api/signUpVendor.dart';
import 'package:donohealth/vendor/screens/vendor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../configs/CustomClipPath.dart';
import '../../configs/SizeConfig.dart';

class VendorSignUpScreen extends StatefulWidget {
  const VendorSignUpScreen({Key? key}) : super(key: key);
  static const routeName = "/vendorSignUpScreen";

  @override
  State<VendorSignUpScreen> createState() => _VendorSignUpScreenState();
}

class _VendorSignUpScreenState extends State<VendorSignUpScreen> {
  var isLoading = false;

  late TextEditingController firstNameTextController = TextEditingController();
  late TextEditingController middleNameTextController = TextEditingController();
  late TextEditingController lastNameTextController = TextEditingController();
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
                height: SizeConfig.safeBlockVertical * 30,
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 60, left: 30),
                      child: Text(
                        'Sign Up',
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
                    controller: firstNameTextController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                  ),
                  TextFormField(
                    controller: middleNameTextController,
                    decoration: const InputDecoration(labelText: 'Other Name'),
                  ),
                  TextFormField(
                    controller: lastNameTextController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                  ),
                  TextFormField(
                    controller: emailTextController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                      controller: passwordTextController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(labelText: 'Password')),
                ],
              ),
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
                  final result = await signUpVendor(
                    firstname: firstNameTextController.text.trim(),
                    middlename: middleNameTextController.text.trim(),
                    lastname: lastNameTextController.text.trim(),
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
                        'Sign Up',
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

import 'package:flutter/material.dart';
import '../../configs/CustomClipPath.dart';
import '../../configs/SizeConfig.dart';
import 'insurer_home_screen.dart';

class InsurerSignUpScreen extends StatelessWidget {
  const InsurerSignUpScreen({Key? key}) : super(key: key);
  static const routeName = "/insurerSignUpScreen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Insurer',
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
                    decoration: const InputDecoration(labelText: 'First Name'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Other Name'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Last Name'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'Password')),
                ],
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: SizeConfig.safeBlockHorizontal * 70,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(InsurerHomeScreen.routeName);
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

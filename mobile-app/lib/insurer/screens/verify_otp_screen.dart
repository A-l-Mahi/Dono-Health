import 'package:donohealth/insurer/screens/otp_status_screen.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../configs/SizeConfig.dart';

class VerifyOTPScreen extends StatefulWidget {
  static const routeName = "/insurerVerifyOTPScreen";
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/otp.png',
                    width: SizeConfig.safeBlockHorizontal * 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'OTP Verification',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text('Enter OTP sent to',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  Text(
                    '+2348166644083',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OTPTextField(
                      length: 4,
                      controller: otpController,
                      width: SizeConfig.safeBlockHorizontal * 60,
                      fieldWidth: 40,
                      style: TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.underline,
                      onCompleted: (pin) {},
                      onChanged: (pin) {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Didn't receive OTP?"),
                      TextButton(
                        onPressed: () {},
                        child: Text('Resend OTP'),
                      ),
                    ],
                  ),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 60,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(OTPStatusScreen.routeName);
                      },
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

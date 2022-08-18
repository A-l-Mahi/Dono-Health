import 'dart:convert';
import 'dart:math';

import 'package:donohealth/vendor/api/verifyOTP.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:unicons/unicons.dart';

import '../../configs/SizeConfig.dart';

class VendorOTPScreen extends StatefulWidget {
  const VendorOTPScreen({Key? key}) : super(key: key);
  static const routeName = "/vendorOTPScreen";

  @override
  State<VendorOTPScreen> createState() => _VendorOTPScreenState();
}

class _VendorOTPScreenState extends State<VendorOTPScreen> {
  OtpFieldController otpController = OtpFieldController();

  String message = "";
  int randomVal = 0000;
  int random(min, max) {
    return min + Random().nextInt(max - min);
  }

  void verify() async {
    var msg = await verifyOTP();
    Map<String, dynamic> response = jsonDecode(msg.body);

    setState(() {
      message = response['SMSMessageData']['Message'];
      randomVal = random(1000, 10000);
    });
  }

  @override
  void initState() {
    verify();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(message),
                    Text('OTP: ${randomVal}'),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ConstrainedBox(
                                constraints: BoxConstraints(maxHeight: 100.0),
                                child: AlertDialog(
                                  insetPadding: EdgeInsets.symmetric(
                                    horizontal: 50.0,
                                    vertical: 100.0,
                                  ),
                                  content: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('ID'),
                                              Text('23D4DED'),
                                            ],
                                          ),
                                          Divider(thickness: 1.5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Date'),
                                              Text('03, August. 2022'),
                                            ],
                                          ),
                                          Divider(thickness: 1.5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Purpose'),
                                              Text('Voucher Codes'),
                                            ],
                                          ),
                                          Divider(thickness: 1.5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Code Category'),
                                              Text('N100'),
                                            ],
                                          ),
                                          Divider(thickness: 1.5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Quantity'),
                                              Text('5X'),
                                            ],
                                          ),
                                          Divider(thickness: 1.5),
                                        ],
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total Amont:',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              'N490',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .errorColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton.icon(
                                              onPressed: () {},
                                              icon: Icon(Icons.share),
                                              label: Text('Share'),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {},
                                              icon: Icon(Icons.picture_as_pdf),
                                              label: Text('Save as PDF'),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(UniconsLine.times),
                                        ),
                                      )
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  title: Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Text('Transaction successful'),
                                  ),
                                  titlePadding: const EdgeInsets.all(0),
                                ),
                              );
                            },
                          );
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
                              width: 1.5,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

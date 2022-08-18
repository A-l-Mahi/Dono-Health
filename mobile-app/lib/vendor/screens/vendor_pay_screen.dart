import 'package:donohealth/vendor/api/buyVoucherCard.dart';
import 'package:donohealth/vendor/configs/VendorClipPath.dart';
import 'package:donohealth/vendor/screens/vendor_otp_screen.dart';
import 'package:donohealth/vendor/widgets/drawer.dart';
import 'package:donohealth/vendor/widgets/vendor_appbar.dart';
import 'package:flutter/material.dart';

import '../../configs/SizeConfig.dart';

class VendorPayScreen extends StatefulWidget {
  const VendorPayScreen({Key? key}) : super(key: key);
  static const routeName = "/vendorPayScreen";

  @override
  State<VendorPayScreen> createState() => _VendorPayScreenState();
}

class _VendorPayScreenState extends State<VendorPayScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late TextEditingController cardNumberTextController = TextEditingController();
  late TextEditingController expiryTextController = TextEditingController();
  late TextEditingController cvvTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: VendorAppBar(_scaffoldKey, context),
      endDrawer: SafeArea(child: VendorDrawer()),
      body: Column(
        children: [
          ClipPath(
            clipper: VendorClipPath(),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              height: SizeConfig.safeBlockVertical * 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.safeBlockVertical * 15),
                    child: Text(
                      'Pay with Card',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Amount: N490',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(height: SizeConfig.safeBlockVertical * 10),
          Expanded(
            flex: 3,
            child: Container(
              width: SizeConfig.safeBlockHorizontal * 90,
              child: Column(
                children: [
                  Text(
                    'Enter Card Details',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    controller: cardNumberTextController,
                    decoration: const InputDecoration(labelText: 'Card Number'),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: expiryTextController,
                            decoration:
                                const InputDecoration(labelText: 'Expiry Date'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: cvvTextController,
                            decoration: const InputDecoration(labelText: 'CVV'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CheckboxListTile(
                    value: false,
                    onChanged: (newValue) {},
                    title: Row(children: [
                      Text("I agree to "),
                      TextButton(
                        onPressed: () {},
                        child: Text('Terms and Conditions'),
                      )
                    ]),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      width: SizeConfig.safeBlockHorizontal * 60,
                      child: OutlinedButton(
                        onPressed: () async {
                          var buy = await buyVoucher(
                              cardnumber: cardNumberTextController.text.trim(),
                              expiry: expiryTextController.text.trim(),
                              cvv: cvvTextController.text.trim(),
                              amount: '50000');
                          Navigator.of(context)
                              .pushNamed(VendorOTPScreen.routeName);
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Pay Now',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.credit_card_outlined,
                                  color: Colors.white)
                            ]),
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

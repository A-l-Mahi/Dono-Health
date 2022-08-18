import 'package:donohealth/vendor/configs/VendorClipPath.dart';
import 'package:donohealth/vendor/screens/voucher_code_quantity.dart';
import 'package:donohealth/vendor/widgets/drawer.dart';
import 'package:donohealth/vendor/widgets/vendor_appbar.dart';
import 'package:flutter/material.dart';

import '../../configs/SizeConfig.dart';

class BuyVoucherCodeScreen extends StatefulWidget {
  const BuyVoucherCodeScreen({Key? key}) : super(key: key);
  static const routeName = "/BuyVoucherCodeScreen";

  @override
  State<BuyVoucherCodeScreen> createState() => _BuyVoucherCodeScreenState();
}

class _BuyVoucherCodeScreenState extends State<BuyVoucherCodeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              height: SizeConfig.safeBlockVertical * 30,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 20, left: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Buy Voucher Code',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: SizeConfig.safeBlockHorizontal * 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Choose Amount Category',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(VoucherCodeQuantity.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'N100.00 @N98.0',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.arrow_forward_outlined)
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
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(VoucherCodeQuantity.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'N200.00 @N198.0',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.arrow_forward_outlined)
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
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(VoucherCodeQuantity.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'N500.00 @N498.0',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.arrow_forward_outlined)
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
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(VoucherCodeQuantity.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'N1000.00 @N998.0',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.arrow_forward_outlined)
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
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(VoucherCodeQuantity.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Other',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.arrow_forward_outlined)
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

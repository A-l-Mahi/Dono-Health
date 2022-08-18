import 'package:donohealth/vendor/screens/vendor_pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../configs/SizeConfig.dart';
import '../configs/VendorClipPath.dart';
import '../widgets/drawer.dart';
import '../widgets/vendor_appbar.dart';

class VoucherCodeQuantity extends StatefulWidget {
  const VoucherCodeQuantity({Key? key}) : super(key: key);
  static const routeName = "VoucherCodeQuantity";

  @override
  State<VoucherCodeQuantity> createState() => _VoucherCodeQuantityState();
}

class _VoucherCodeQuantityState extends State<VoucherCodeQuantity> {
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
                        'Voucher Code Quantity',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      initialValue: '5',
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 1.5),
                                        ),
                                      ),
                                    ),
                                    Text('N98.0 (Each)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Icon(UniconsLine.minus),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Icon(
                                    UniconsLine.plus,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 24),
                            ),
                            Text(
                              'N490.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 24),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 60,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(VendorPayScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Proceed',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward, color: Colors.white)
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
                Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

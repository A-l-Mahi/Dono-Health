import 'package:donohealth/vendor/configs/VendorClipPath.dart';
import 'package:donohealth/vendor/screens/buy_voucher_code_screen.dart';
import 'package:donohealth/vendor/screens/my_voucher_codes_screen.dart';
import 'package:donohealth/vendor/widgets/drawer.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../configs/SizeConfig.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({Key? key}) : super(key: key);
  static const routeName = "/vendorHomeScreen";

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List transactions = [
      Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text('X5'),
          ),
          title: Text(
            'Voucher Cards',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('12:25pm 24 Aug, 2022'),
          trailing: Text(
            '+5500',
            style: TextStyle(
                color: Color(0xff0D8536),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text('X25'),
          ),
          title: Text(
            'Voucher Cards',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('12:25pm 24 Aug, 2022'),
          trailing: Text(
            '+10,000',
            style: TextStyle(
                color: Color(0xff0D8536),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text('X170'),
          ),
          title: Text(
            'Voucher Cards',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('12:25pm 24 Aug, 2022'),
          trailing: Text(
            '+140,000',
            style: TextStyle(
                color: Color(0xff0D8536),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text('X5'),
          ),
          title: Text(
            'Voucher Cards',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('12:25pm 24 Aug, 2022'),
          trailing: Text(
            '+5500',
            style: TextStyle(
                color: Color(0xff0D8536),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/mike.png',
                width: 20,
              )),
        ),
        title: const ListTile(
          title: Text('Hello,',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          subtitle: Text('Mike Dane ${Emojis.wavingHand}',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              splashColor: Theme.of(context).primaryColor,
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              icon: const Icon(UniconsLine.align_center, size: 28),
            ),
          )
        ],
      ),
      endDrawer: SafeArea(child: VendorDrawer()),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: SizeConfig.safeBlockVertical * 30,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: VendorClipPath(),
                    child: Container(
                        alignment: Alignment.bottomLeft,
                        width: double.infinity,
                        color: Theme.of(context).primaryColor,
                        height: SizeConfig.safeBlockVertical * 30,
                        child: const Text('')),
                  ),
                  Positioned(
                    top: SizeConfig.safeBlockVertical * 20,
                    child: Container(
                      width: SizeConfig.safeBlockHorizontal * 80,
                      height: SizeConfig.safeBlockVertical * 25,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                'Voucher Cards',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'X1,100',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                'Your total balance',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'N20,000.00',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              height: SizeConfig.safeBlockVertical * 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(MyVoucherCodesScreen.routeName);
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              UniconsLine.list_ul,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              'My Voucher Codes',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(BuyVoucherCodeScreen.routeName);
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              UniconsLine.postcard,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              'Buy Voucher Code',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Column(
              children: [
                Container(
                  child: ListTile(
                    title: Text(
                      "Transactions",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    trailing: TextButton(
                        onPressed: () {}, child: Text('View all history')),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: transactions.length,
                      itemBuilder: (context, index) => transactions[index]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

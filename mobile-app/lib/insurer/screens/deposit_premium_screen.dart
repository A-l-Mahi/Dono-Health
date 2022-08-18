import 'package:donohealth/insurer/screens/insurer_pay_screen.dart';
import 'package:flutter/material.dart';

import 'package:donohealth/insurer/configs/InsurerClipPath.dart';
import '../../configs/SizeConfig.dart';
import '../widgets/dono_appbar.dart';
import '../widgets/drawer.dart';

class DepositPremiumScreen extends StatefulWidget {
  const DepositPremiumScreen({Key? key}) : super(key: key);
  static const routeName = "/insurerDepositPremiumScreen";

  @override
  State<DepositPremiumScreen> createState() => _DepositPremiumScreenState();
}

class _DepositPremiumScreenState extends State<DepositPremiumScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: DonoAppBar(_scaffoldKey, context),
      endDrawer: SafeArea(child: DonoDrawer()),
      body: Column(
        children: [
          ClipPath(
            clipper: InsurerClipPath(),
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
                        'Deposit Premium',
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
                    'Choose Amount',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(InsurerPayScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'N100.00',
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
                          .pushNamed(InsurerPayScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'N200.00',
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
                          .pushNamed(InsurerPayScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'N500.00',
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
                          .pushNamed(InsurerPayScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'N1000.00',
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
                          .pushNamed(InsurerPayScreen.routeName);
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

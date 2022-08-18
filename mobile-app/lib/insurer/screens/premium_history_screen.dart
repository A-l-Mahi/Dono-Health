import 'package:donohealth/insurer/screens/premium_info_screen.dart';
import 'package:flutter/material.dart';

import '../../configs/SizeConfig.dart';
import '../configs/InsurerClipPath.dart';
import '../widgets/dono_appbar.dart';
import '../widgets/drawer.dart';

class PremiumHistoryScreen extends StatefulWidget {
  static const routeName = "/premiumHistoryScreen";
  const PremiumHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PremiumHistoryScreen> createState() => _PremiumHistoryScreenState();
}

class _PremiumHistoryScreenState extends State<PremiumHistoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List transactions = [
      Card(
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(PremiumInfoScreen.routeName);
          },
          title: Text(
            'Monthly Premium Deposit',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('12:25pm 27 Dec, 2022'),
          trailing: Text(
            '+3000',
            style: TextStyle(
                color: Color(0xff0D8536),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Card(
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(PremiumInfoScreen.routeName);
          },
          title: Text(
            'Monthly Premium Deposit',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('12:25pm 29 Nov, 2022'),
          trailing: Text(
            '+500',
            style: TextStyle(
                color: Color(0xff0D8536),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Card(
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(PremiumInfoScreen.routeName);
          },
          title: Text(
            'Monthly Premium Deposit',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('12:25pm 24 Oct, 2022'),
          trailing: Text(
            '+1000',
            style: TextStyle(
                color: Color(0xff0D8536),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Card(
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(PremiumInfoScreen.routeName);
          },
          title: Text(
            'Monthly Premium Deposit',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('12:25pm 28 Sept, 2022'),
          trailing: Text(
            '+3000',
            style: TextStyle(
                color: Color(0xff0D8536),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Card(
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(PremiumInfoScreen.routeName);
          },
          title: Text(
            'Monthly Premium Deposit',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('12:25pm 24 Aug, 2022'),
          trailing: Text(
            '+10000',
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
                        'Premium History',
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
              children: [
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

import 'dart:math';

import 'package:donohealth/insurer/configs/InsurerClipPath.dart';
import 'package:donohealth/insurer/screens/deposit_premium_screen.dart';
import 'package:donohealth/insurer/screens/medication_history_screen.dart';
import 'package:donohealth/insurer/screens/premium_history_screen.dart';
import 'package:donohealth/insurer/widgets/drawer.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../configs/SizeConfig.dart';

class InsurerHomeScreen extends StatefulWidget {
  static const routeName = "/insurerHomeScreen";
  const InsurerHomeScreen({Key? key}) : super(key: key);

  @override
  State<InsurerHomeScreen> createState() => _InsurerHomeScreenState();
}

class _InsurerHomeScreenState extends State<InsurerHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List transactions = const [
      Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(
              UniconsLine.medical_square,
              size: 30,
            ),
          ),
          title: Text(
            'Medication',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('12:25pm 24 Aug, 2022'),
          trailing: Text(
            '-1500',
            style: TextStyle(
                color: Color(0xffED7390),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(
              UniconsLine.dollar_alt,
              size: 30,
            ),
          ),
          title: Text(
            'Premium Deposit',
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
          title: Text(
            'Premium Deposit',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          leading: CircleAvatar(
            child: Icon(
              UniconsLine.dollar_alt,
              size: 30,
            ),
          ),
          subtitle: Text('12:25pm 24 Aug, 2022'),
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
          title: Text(
            'Medication',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          leading: CircleAvatar(
            child: Icon(
              UniconsLine.medical_square,
              size: 30,
            ),
          ),
          subtitle: Text('12:25pm 24 Aug, 2022'),
          trailing: Text(
            '-1000',
            style: TextStyle(
                color: Color(0xffED7390),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: Text(
            'Premium Deposit',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          leading: CircleAvatar(
            child: Icon(
              UniconsLine.dollar_alt,
              size: 30,
            ),
          ),
          subtitle: Text('12:25pm 24 Aug, 2022'),
          trailing: Text(
            '+3000',
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
                'assets/images/pro.jpg',
                width: 20,
              )),
        ),
        title: const ListTile(
          title: Text('Hello,',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          subtitle: Text('Suleiman Adamu ${Emojis.wavingHand}',
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
      endDrawer: SafeArea(child: DonoDrawer()),
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
                    clipper: InsurerClipPath(),
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
                            Expanded(
                              child: Chart(
                                layers: layers(),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12.0)
                                        .copyWith(
                                  bottom: 12.0,
                                ),
                              ),
                            )
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
                            .pushNamed(MedicationHistoryScreen.routeName);
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              UniconsLine.medical_square,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              'Medication History',
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
                            .pushNamed(DepositPremiumScreen.routeName);
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              UniconsLine.plus_circle,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              'Deposit Premium',
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
                            .pushNamed(PremiumHistoryScreen.routeName);
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.history,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              'Premium History',
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

List<ChartLayer> layers() {
  return [
    ChartAxisLayer(
      settings: ChartAxisSettings(
        x: ChartAxisSettingsAxis(
          frequency: 1.0,
          max: 12.0,
          min: 7.0,
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 10.0,
          ),
        ),
        y: ChartAxisSettingsAxis(
          frequency: 100.0,
          max: 300.0,
          min: 0.0,
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 10.0,
          ),
        ),
      ),
      labelX: (value) => value.toInt().toString(),
      labelY: (value) => value.toInt().toString(),
    ),
    ChartGroupBarLayer(
      items: List.generate(
        12 - 7 + 1,
        (index) => [
          ChartGroupBarDataItem(
            color: Color(0xff233ce4),
            x: index + 7,
            value: Random().nextInt(280) + 20,
          ),
          ChartGroupBarDataItem(
            color: const Color(0xFFFF4150),
            x: index + 7,
            value: Random().nextInt(280) + 20,
          ),
        ],
      ),
      settings: const ChartGroupBarSettings(
        thickness: 8.0,
        radius: BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
    ChartTooltipLayer(
      shape: () => ChartTooltipBarShape<ChartGroupBarDataItem>(
        backgroundColor: Colors.white,
        currentPos: (item) => item.currentValuePos,
        currentSize: (item) => item.currentValueSize,
        onTextValue: (item) => 'N${item.value.toString()}',
        marginBottom: 6.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        radius: 6.0,
        textStyle: const TextStyle(
          color: Color(0xff233ce4),
          letterSpacing: 0.2,
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  ];
}

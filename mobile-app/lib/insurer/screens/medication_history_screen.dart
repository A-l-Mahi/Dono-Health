import 'package:donohealth/insurer/screens/medical_info_screen.dart';
import 'package:flutter/material.dart';

import '../../configs/SizeConfig.dart';
import '../configs/InsurerClipPath.dart';
import '../widgets/dono_appbar.dart';
import '../widgets/drawer.dart';

class MedicationHistoryScreen extends StatefulWidget {
  static const routeName = "/medicationHistoryScreen";
  const MedicationHistoryScreen({Key? key}) : super(key: key);

  @override
  State<MedicationHistoryScreen> createState() =>
      _MedicationHistoryScreenState();
}

class _MedicationHistoryScreenState extends State<MedicationHistoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List transactions = [
      Card(
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(MedicalInfoScreen.routeName);
          },
          title: Text(
            'Leg injury',
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
          title: Text(
            'Leg injury',
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
          title: Text(
            'Medical Checkup',
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
          title: Text(
            'Emergency Ulcer',
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
          title: Text(
            'Accident',
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
          title: Text(
            'Headache',
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
          title: Text(
            'Leg injury',
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
          title: Text(
            'Leg injury',
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
                        'Medical History',
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

import 'package:flutter/material.dart';

import '../../configs/SizeConfig.dart';

class MedicalInfoScreen extends StatefulWidget {
  const MedicalInfoScreen({Key? key}) : super(key: key);
  static const routeName = "/medicationInfoScreen";

  @override
  State<MedicalInfoScreen> createState() => _MedicalInfoScreenState();
}

class _MedicalInfoScreenState extends State<MedicalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Leg Injury'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  CardInfo(
                    title: "Amount Deducted",
                    content: "N1500.00",
                  ),
                  Divider(thickness: 1.5),
                  CardInfo(
                    title: "Medication From",
                    content: "Alqalam Univesity Clinic",
                  ),
                  Divider(thickness: 1.5),
                  CardInfo(
                    title: "Medication Time",
                    content: "On 23rd Aug 2022, at 2:35pm",
                  ),
                  Divider(thickness: 1.5),
                  CardInfo(
                    title: "Problem",
                    content: "A Leg Injury",
                  ),
                  Divider(thickness: 1.5),
                  CardInfo(
                    title: "Problem Description",
                    content: "A Serious  Leg Injury caused by gas accident",
                  ),
                  Divider(thickness: 1.5),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: OutlinedButton(
              onPressed: () {
                // Navigator.of(context)
                //     .pushNamed(InsurerHomeScreen.routeName);
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Delete History',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.delete, color: Colors.white)
                  ]),
              style: OutlinedButton.styleFrom(
                backgroundColor: Theme.of(context).errorColor,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                side:
                    BorderSide(width: 1.5, color: Theme.of(context).errorColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  String title;
  String content;
  CardInfo({required this.title, required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(title + ':',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueGrey,
              )),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(content,
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400)),
        )
      ],
    );
  }
}

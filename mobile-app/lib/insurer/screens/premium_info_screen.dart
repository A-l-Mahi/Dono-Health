import 'package:flutter/material.dart';

import '../../configs/SizeConfig.dart';

class PremiumInfoScreen extends StatefulWidget {
  static const routeName = "/premiumHInfoScreen";
  const PremiumInfoScreen({Key? key}) : super(key: key);

  @override
  State<PremiumInfoScreen> createState() => _PremiumInfoScreenState();
}

class _PremiumInfoScreenState extends State<PremiumInfoScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Deposit'),
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
                    title: "Amount Deposited",
                    content: "N3000.00",
                  ),
                  Divider(thickness: 1.5),
                  CardInfo(
                    title: "Deposit Time",
                    content: "On 23rd Aug 2022, at 2:35pm",
                  ),
                  Divider(thickness: 1.5),
                  CardInfo(
                    title: "Bank Name",
                    content: "FSI Bank LTD",
                  ),
                  Divider(thickness: 1.5),
                  CardInfo(
                    title: "Description",
                    content: "Montly insurer deposit for Dono Health Insurer",
                  ),
                  Divider(thickness: 1.5),
                  OutlinedButton(
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Reveal Card Details',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.credit_card_outlined)
                        ]),
                  )
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

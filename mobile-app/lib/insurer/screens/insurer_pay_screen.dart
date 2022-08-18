import 'package:donohealth/insurer/screens/verify_otp_screen.dart';
import 'package:flutter/material.dart';

import '../../configs/SizeConfig.dart';
import '../configs/InsurerClipPath.dart';
import '../widgets/dono_appbar.dart';
import '../widgets/drawer.dart';

class InsurerPayScreen extends StatefulWidget {
  const InsurerPayScreen({Key? key}) : super(key: key);
  static const routeName = "/insurerPayScreen";

  @override
  State<InsurerPayScreen> createState() => _InsurerPayScreenState();
}

class _InsurerPayScreenState extends State<InsurerPayScreen> {
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
                      'Deposit Amount: N500',
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
          Expanded(
            child: CardsSwipe(),
          ),
          Expanded(
            flex: 2,
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
                    decoration: const InputDecoration(labelText: 'Card Number'),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Expiry Date'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
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
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(VerifyOTPScreen.routeName);
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

class CardsSwipe extends StatefulWidget {
  const CardsSwipe({Key? key}) : super(key: key);

  @override
  State<CardsSwipe> createState() => _CardsSwipeState();
}

class _CardsSwipeState extends State<CardsSwipe> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    List cards = [
      Transform.scale(
        scale: 0.95,
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (_) => const DepositAmoountScreen()),
            // );
          },
          child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/card (1).png',
                fit: BoxFit.fill,
              )),
        ),
      ),
      Transform.scale(
        scale: 0.95,
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (_) => const DepositAmoountScreen()),
            // );
          },
          child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/card (2).png',
                fit: BoxFit.fill,
              )),
        ),
      ),
      Transform.scale(
        scale: 0.95,
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (_) => const DepositAmoountScreen()),
            // );
          },
          child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/card (3).png',
                fit: BoxFit.fill,
              )),
        ),
      ),
    ];
    return SizedBox(
      height: 200, // card height
      child: PageView.builder(
          itemCount: cards.length,
          controller: PageController(viewportFraction: 0.8),
          onPageChanged: (int index) => {setState(() => _index = index)},
          itemBuilder: (_, i) => cards[i]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../configs/SizeConfig.dart';
import '../configs/InsurerClipPath.dart';

class InsurerSettinsScreen extends StatefulWidget {
  const InsurerSettinsScreen({Key? key}) : super(key: key);
  static const routeName = "/insurerSettingsScreen";

  @override
  State<InsurerSettinsScreen> createState() => _InsurerSettinsScreenState();
}

class _InsurerSettinsScreenState extends State<InsurerSettinsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        elevation: 0,
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: InsurerClipPath(),
            child: Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              height: SizeConfig.safeBlockVertical * 10,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Current Monthly Plan: N100',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            child: CardsSwipe(),
          ),
          Container(
            height: SizeConfig.safeBlockVertical * 10,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: SizeConfig.safeBlockHorizontal * 60,
                  ),
                  Text(
                    'Version  1.0',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
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
        child: Container(
          child: GestureDetector(
            onTap: () {},
            child: Card(
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      UniconsLine.check_square,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                  Text(
                    'Month',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Text(
                    'N100',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Transform.scale(
        scale: 0.95,
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 30,
          child: GestureDetector(
            onTap: () {},
            child: Card(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      UniconsLine.check_square,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                  Text(
                    'Month',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Text(
                    'N200',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Transform.scale(
        scale: 0.95,
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 30,
          child: GestureDetector(
            onTap: () {},
            child: Card(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      UniconsLine.check_square,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                  Text(
                    'Month',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Text(
                    'N200',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Transform.scale(
        scale: 0.95,
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 30,
          child: GestureDetector(
            onTap: () {},
            child: Card(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      UniconsLine.check_square,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                  Text(
                    'Month',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Text(
                    'N500',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Transform.scale(
        scale: 0.95,
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 30,
          child: GestureDetector(
            onTap: () {},
            child: Card(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      UniconsLine.check_square,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                  Text(
                    'Month',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Text(
                    'N1000',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ];
    return SizedBox(
      height: 200, // card height
      child: PageView.builder(
          itemCount: cards.length,
          controller: PageController(viewportFraction: 0.5),
          onPageChanged: (int index) => {setState(() => _index = index)},
          itemBuilder: (_, i) => cards[i]),
    );
  }
}

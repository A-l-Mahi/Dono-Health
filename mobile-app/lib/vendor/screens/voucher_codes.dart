import 'package:flutter/material.dart';

import '../../configs/SizeConfig.dart';
import '../configs/VendorClipPath.dart';
import '../widgets/drawer.dart';
import '../widgets/vendor_appbar.dart';

class VoucherCodes extends StatefulWidget {
  const VoucherCodes({Key? key}) : super(key: key);
  static const routeName = "/voucherCodeListScreen";

  @override
  State<VoucherCodes> createState() => _VoucherCodesState();
}

class _VoucherCodesState extends State<VoucherCodes> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List codes = [
      Card(
        child: ListTile(
          title: Text(
            '434-879-270',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            'Un-used',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: Text(
            '4342-4323-4321',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            'Un-used',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: Text(
            '4342-4323-4321',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            'Used',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: Text(
            '4342-4323-4321',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            'Un-used',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: Text(
            '4342-4323-4321',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            'Un-used',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: Text(
            '4342-4323-4321',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            'Used',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: Text(
            '4342-4323-4321',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            'Un-used',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: Text(
            '4342-4323-4321',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            'Un-used',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: Text(
            '4342-4323-4321',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            'Used',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      Card(
        child: ListTile(
          title: Text(
            '4342-4323-4321',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            'Used',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.print),
      ),
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
                        'X100 Voucher Codes',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: codes.length,
                itemBuilder: (context, index) => codes[index]),
          )
        ],
      ),
    );
  }
}

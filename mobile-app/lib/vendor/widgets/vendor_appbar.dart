import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

PreferredSizeWidget VendorAppBar(_scaffoldKey, context) {
  return AppBar(
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
      title: Text('Mike Dane',
          style: TextStyle(fontSize: 18, color: Colors.white)),
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
  );
}

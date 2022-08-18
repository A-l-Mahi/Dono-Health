import 'dart:convert';

import 'package:http/http.dart' as http;

verifyOTP() async {
  try {
    var url =
        Uri.parse('https://fsi.ng/api/v1/africastalking/version1/messaging');

    final response = await http.post(url,
        headers: {
          'Content-Type': ' application/json',
          'sandbox-key': 't4sqorF1Y5XbWFSipeGV2GEU4Ge0A38v1660681692'
        },
        body: json.encode({
          "username": "vendor",
          "to": "+2348166644083",
          "message": "testing message"
        }));

    return response;
  } catch (e) {
    return e;
  }
}

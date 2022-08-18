import 'dart:convert';

import 'package:http/http.dart' as http;

buyVoucher({
  required String cardnumber,
  required String expiry,
  required String cvv,
  required String amount,
}) async {
  try {
    var url = Uri.parse(
        'https://3rmiqrvi56.execute-api.us-east-2.amazonaws.com/prod');

    final response = await http.post(url,
        body: json.encode({
          "type": "addFunds",
          "email": "mahigital@gmail.com",
          "cardNumber": cardnumber,
          "cardName": "Mahi Aminu Aliyu",
          "expiry": expiry,
          "cvv": cvv,
          "amount": amount
        }));

    return response;
  } catch (e) {
    return e;
  }
}

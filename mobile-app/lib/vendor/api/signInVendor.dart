import 'dart:convert';

import 'package:http/http.dart' as http;

signInVendor({
  required String email,
  required String password,
}) async {
  try {
    var url = Uri.parse(
        'https://fcz3hmjja0.execute-api.us-east-2.amazonaws.com/prod?');

    final response = await http.post(url,
        body: json
            .encode({"type": "login", "password": password, "email": email}));

    return response;
  } catch (e) {
    return e;
  }
}

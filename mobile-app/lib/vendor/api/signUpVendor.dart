import 'dart:convert';

import 'package:http/http.dart' as http;

signUpVendor({
  required String firstname,
  required String middlename,
  required String lastname,
  required String email,
  required String password,
}) async {
  try {
    var url = Uri.parse(
        'https://fcz3hmjja0.execute-api.us-east-2.amazonaws.com/prod?');

    final response = await http.post(url,
        body: json.encode({
          "type": "create",
          "user1": "vendor",
          "first_name": firstname,
          "last_name": lastname,
          "middle_name": middlename,
          "password": password,
          "email": email
        }));

    return response;
  } catch (e) {
    return e;
  }
}

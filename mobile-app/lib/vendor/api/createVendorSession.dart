import 'package:shared_preferences/shared_preferences.dart';

createVendorSession({required String userType, required String email}) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString('userType', userType);
  await prefs.setString('email', email);
}

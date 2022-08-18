import 'package:donohealth/insurer/screens/deposit_premium_screen.dart';
import 'package:donohealth/insurer/screens/insurer_edit_profile.dart';
import 'package:donohealth/insurer/screens/insurer_home_screen.dart';
import 'package:donohealth/insurer/screens/insurer_pay_screen.dart';
import 'package:donohealth/insurer/screens/insurer_settings_screen.dart';
import 'package:donohealth/insurer/screens/insurer_sign_in_screen.dart';
import 'package:donohealth/insurer/screens/insurer_sign_in_up_screen.dart';
import 'package:donohealth/insurer/screens/insurer_sign_up_screen.dart';
import 'package:donohealth/insurer/screens/medical_info_screen.dart';
import 'package:donohealth/insurer/screens/medication_history_screen.dart';
import 'package:donohealth/insurer/screens/otp_status_screen.dart';
import 'package:donohealth/insurer/screens/premium_history_screen.dart';
import 'package:donohealth/insurer/screens/premium_info_screen.dart';
import 'package:donohealth/insurer/screens/verify_otp_screen.dart';
import 'package:donohealth/insurer_vendor_screen.dart';
import 'package:donohealth/onboarding_screen.dart';
import 'package:donohealth/vendor/screens/buy_voucher_code_screen.dart';
import 'package:donohealth/vendor/screens/my_voucher_codes_screen.dart';
import 'package:donohealth/vendor/screens/vendor_home_screen.dart';
import 'package:donohealth/vendor/screens/vendor_otp_screen.dart';
import 'package:donohealth/vendor/screens/vendor_pay_screen.dart';
import 'package:donohealth/vendor/screens/vendor_profile_screen.dart';
import 'package:donohealth/vendor/screens/vendor_settings_screen.dart';
import 'package:donohealth/vendor/screens/vendor_sign_in_screen.dart';
import 'package:donohealth/vendor/screens/vendor_sign_in_up_screen.dart';
import 'package:donohealth/vendor/screens/vendor_sign_up_screen.dart';
import 'package:donohealth/vendor/screens/voucher_code_quantity.dart';
import 'package:donohealth/vendor/screens/voucher_codes.dart';
import 'package:flutter/material.dart';
import 'package:donohealth/splash_screen.dart';
import 'package:flutter/services.dart';
import 'configs/palette.dart';

void main(List<String> args) {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const DonoHealth());
}

class DonoHealth extends StatelessWidget {
  const DonoHealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dono Health",
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch: Palette.donoHealthTheme,
      ),
      routes: {
        OnboardingScreen.routeName: (ctx) => const OnboardingScreen(),
        InsurerVendorScreen.routeName: (ctx) => const InsurerVendorScreen(),
        InsurerSignInUpScreen.routeName: (ctx) => const InsurerSignInUpScreen(),
        InsurerSignInScreen.routeName: (ctx) => const InsurerSignInScreen(),
        InsurerHomeScreen.routeName: (ctx) => const InsurerHomeScreen(),
        InsurerSignUpScreen.routeName: (ctx) => const InsurerSignUpScreen(),
        DepositPremiumScreen.routeName: (ctx) => const DepositPremiumScreen(),
        InsurerPayScreen.routeName: (ctx) => const InsurerPayScreen(),
        MedicationHistoryScreen.routeName: (ctx) =>
            const MedicationHistoryScreen(),
        MedicalInfoScreen.routeName: (ctx) => const MedicalInfoScreen(),
        PremiumHistoryScreen.routeName: (ctx) => const PremiumHistoryScreen(),
        PremiumInfoScreen.routeName: (ctx) => const PremiumInfoScreen(),
        InsurerEditProfile.routeName: (ctx) => const InsurerEditProfile(),
        InsurerSettinsScreen.routeName: (ctx) => const InsurerSettinsScreen(),
        VerifyOTPScreen.routeName: (ctx) => const VerifyOTPScreen(),
        OTPStatusScreen.routeName: (ctx) => const OTPStatusScreen(),

        // Vendor
        VendorSignInUpScreen.routeName: (ctx) => const VendorSignInUpScreen(),
        VendorSignUpScreen.routeName: (ctx) => const VendorSignUpScreen(),
        VendorSignInScreen.routeName: (ctx) => const VendorSignInScreen(),
        VendorHomeScreen.routeName: (ctx) => const VendorHomeScreen(),
        MyVoucherCodesScreen.routeName: (ctx) => const MyVoucherCodesScreen(),
        BuyVoucherCodeScreen.routeName: (ctx) => const BuyVoucherCodeScreen(),
        VoucherCodeQuantity.routeName: (ctx) => const VoucherCodeQuantity(),
        VendorProfileScreen.routeName: (ctx) => const VendorProfileScreen(),
        VendorSettingsScreen.routeName: (ctx) => const VendorSettingsScreen(),
        VendorPayScreen.routeName: (ctx) => const VendorPayScreen(),
        VendorOTPScreen.routeName: (ctx) => const VendorOTPScreen(),
        VoucherCodes.routeName: (ctx) => const VoucherCodes(),
      },
    );
  }
}

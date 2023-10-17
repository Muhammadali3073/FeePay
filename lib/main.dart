import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payfee/controller/phone_auth_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller/facebook_sign_in_controller.dart';
import 'controller/google_sign_in_controller.dart';
import 'firebase_options.dart';
import 'utils/color_data.dart';
import 'view/SplashLanguageScreens/splash_screen.dart';
import 'view/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleSignInController googleSignInController =
      Get.put(GoogleSignInController(), tag: 'googleSignInController');
  FaceBookSignInController faceBookSignInController =
      Get.put(FaceBookSignInController(), tag: 'faceBookSignInController');
  PhoneAuthController phoneAuthController =
      Get.put(PhoneAuthController(), tag: 'phoneAuthController');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneAuthController.getPhoneNumberFromSharePref();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Language(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          theme: ThemeData(
              fontFamily: GoogleFonts.manrope().toString(),
              useMaterial3: true,
              colorScheme: ColorScheme.light(background: backgroundColor)),
          home: const SplashScreen(),
        );
      },
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iot_security_cam/di/locator.dart';
import 'package:flutter_iot_security_cam/routes.dart';
import 'package:flutter_iot_security_cam/src/presentation/screen/login/login_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'src/presentation/screen/home/home_provider.dart';
import 'src/presentation/screen/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (c) => HomeProvider(),
          ),
          ChangeNotifierProvider(
            create: (c) => LoginProvider(
              authRepository: locator(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Secure Camera',
          // navigatorKey: getIt<NavigationService>().navigatorKey,
          debugShowCheckedModeBanner: true,
          themeMode: themeMode,
          theme: ThemeData(
            fontFamily: 'Nato Sans',
            textSelectionTheme: const TextSelectionThemeData(
              // Set Up for TextFields
              cursorColor: Colors.grey,
              selectionColor: Colors.blueGrey,
            ),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFF2F2F2),
              //secondary: Color(0xFFF4AE47),
              surface: Color(0xFFC4C4C4),
              background: Color(0xFFFFFFFF),
              error: Color(0xFFB00020),
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: Colors.black,
              onBackground: Colors.black,
              onError: Colors.white,
              brightness: Brightness.light,
            ),
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Color(0xFF464646),
              ),
              displayMedium: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xFF464646),
              ),
              displaySmall: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Color(0xFF464646),
              ),
            ),
          ),
          routes: routes,
          home: const SplashScreen(),
        ));
  }
}

import 'package:fauth/home.dart';
import 'package:fauth/login.dart';
import 'package:fauth/provider.dart';
import 'package:fauth/register.dart';
import 'package:fauth/spalsh.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDu2okAjv7vnipD5uIYWJNTL3jyHL4KEwo",
      appId: "1:954257370129:web:d4759438431d3bf16055b0",
      messagingSenderId: "954257370129",
      projectId: "fauth-cbb73",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Route<dynamic> _getRoute(RouteSettings settings) {
  //   if (settings.name != '/login') {
  //     return null;
  //   }

  //   return MaterialPageRoute<void>(
  //     settings: settings,
  //     builder: (BuildContext context) => LoginPage(),
  //     fullscreenDialog: true,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          create: (_) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/splash',
        // onGenerateRoute: _getRoute,
        routes: {
          '/splash': (context) => Splash(),
          '/': (context) => Home(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
        },
      ),
    );
  }
}

import 'package:fauth/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
      WidgetsBinding.instance
        .addPostFrameCallback((_) {
          Provider.of<AppProvider>(context, listen: false).init();
          if (Provider.of<AppProvider>(context, listen: false).currentUser != null) {
            Navigator.pushNamed(context, '/');
          } else {
             Navigator.pushNamed(context, '/login');
          }


        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
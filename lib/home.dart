import 'package:fauth/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text('Home'),),
          TextButton(onPressed: () {
            Provider.of<AppProvider>(context, listen: false).signOut();
          }, child: Text('logout'))
        ],
      ),
    );
  }
}
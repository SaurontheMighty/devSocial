import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'devSocial',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
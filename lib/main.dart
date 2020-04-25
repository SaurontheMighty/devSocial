import 'package:flutter/material.dart';
import 'package:devsocial/paths/home.dart';
import 'package:devsocial/paths/welcome.dart';
import 'package:devsocial/paths/login.dart';
import 'package:devsocial/paths/signup.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/login',
  routes: {
    '/': (context)=> Welcome(),
    '/home': (context)=> Home(),
    '/login': (context)=> Login(),
    '/signup': (context)=> Signup()
  },
));
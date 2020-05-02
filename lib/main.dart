import 'package:flutter/material.dart';
import 'package:devsocial/paths/home.dart';
import 'package:devsocial/paths/welcome.dart';
import 'package:devsocial/paths/login.dart';
import 'package:devsocial/paths/signup.dart';
import 'package:devsocial/sauronthemighty.dart';

//randomcomment
void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context)=> Welcome(),
    '/home': (context)=> Home(),
    '/login': (context)=> Login(),
    '/signup': (context)=> Signup(),
    '/sauronthemighty': (context)=> sauronthemighty()
  },
));
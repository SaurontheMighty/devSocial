import 'package:flutter/material.dart';
import 'package:devsocial/paths/loading.dart';
import 'package:devsocial/paths/home.dart';
import 'package:devsocial/paths/login.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context)=> Loading(),
    '/home': (context)=> Home(),
    '/login': (context)=> Login()
  },
));
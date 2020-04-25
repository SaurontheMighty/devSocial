import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
              height: 80,
            ),
            Image.asset('insert good logo'),
            SizedBox(
              height: 40,
            ),
            Text('Login',
            style: TextStyle(fontSize: 40, color: Colors.red),
            )
              ],
            ),
            SizedBox(height: 70), 
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(fontSize: 20),
              )
            ),
             SizedBox(height: 25), 
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(fontSize: 20),
              )
            ),
            SizedBox(height: 30),
            FlatButton(onPressed: (){ 
              Navigator.pushNamed(context, '/home');}
            , child: 
            Text(
              "Login"
            ),
            color: Colors.blue,)
          ],
        ),
      ),
      
    );
  }
}

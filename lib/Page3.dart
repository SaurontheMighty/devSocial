import 'package:devsocial/paths/login.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  String x = data.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            new Container(
              width: 150 ,
              height: 150,
              decoration: 
              new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                      fit: BoxFit.fill,
                    image: new NetworkImage(
                                data.image)
                          )
                            ),
               ),
               SizedBox(
                 height:  50,
               ),

           Text(data.email)
          ],
        ),            
      ),
    );
  }
}
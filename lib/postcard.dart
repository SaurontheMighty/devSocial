import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8,8,8,15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.code),
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0,8,8,10),
                child: Text(
                  'Best programming language?',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
              ),
              
              subtitle: Text('PYTHON iss the besst.'),
            ),
          ],
        ),
      ),
    ),
  );
  }
}
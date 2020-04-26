import 'package:flutter/material.dart';
import 'package:devsocial/post.dart';

class PostCard extends StatelessWidget {
  
  final Post post;
  PostCard({this.post});  

  @override
  Widget build(BuildContext context) {
    return Center(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8,8,8,15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.code),
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0,8,8,10),
                child: Text(
                  post.title,
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
              ),
              subtitle: Text(post.subtitle),
            ),
          ],
        ),
      ),
    ),
  );
  }
}
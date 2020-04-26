import 'package:flutter/material.dart';
import 'package:devsocial/postcard.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  List<Post> posts = [
    Post(title:"Don't do drugs kids.", subtitle: 'Ok boomer.'),
    Post(title:"What is the best programming language", subtitle: 'PYTHON is the best')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: posts.map((post)=>PostCard(
            post: post,
        )
        ).toList(),
    );
  }
}
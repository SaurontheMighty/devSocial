import 'package:flutter/material.dart';
import 'package:devsocial/friendcard.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  List<Friend> friends = [
    Friend(name:"SaurontheMighty", status: 'Online', chat: '/sauronthemighty'),
    Friend(name:"miphc42", status: 'Offline', chat: '/miphc42')
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: friends.map((friend)=>FriendCard(
            friend: friend,
        )
        ).toList(),
    );
  }
}
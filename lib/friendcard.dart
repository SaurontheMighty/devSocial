import 'package:flutter/material.dart';

class Friend {
  String name;
  String status;

  Friend({this.name, this.status});
}

class FriendCard extends StatelessWidget {
  
  final Friend friend;
  FriendCard({this.friend});  

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.black;
    if(friend.status == 'Online'){
      statusColor = Colors.green[400];
    }
    return Center(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4,4,4,10),
        child: ListTile(
          leading: Icon(
            Icons.cloud_circle,
            color: statusColor,
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0,8,8,10),
            child: Text(
              friend.name,
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
              ),
            ),
          ),
          subtitle: Text(friend.status),
        ),
      ),
    ),
  );
  }
}
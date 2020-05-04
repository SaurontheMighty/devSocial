import 'package:flutter/material.dart';
 
class Texting extends StatefulWidget {
  @override
  _TextingState createState() => _TextingState();
}

class _TextingState extends State<Texting> { 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SaurontheMighty',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
           Container(
      padding: EdgeInsets.symmetric(horizontal: 9.0),
      color: Colors.white,
      height: 60.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(7, 0, 7 , 0),
                enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                          ),
                focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
    ),
          ],
        ),
      ),
    );
  }
}
 

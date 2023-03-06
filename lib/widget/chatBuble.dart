import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/message.dart';
import 'contans.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key,required this.message});

 final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        padding: EdgeInsets.only(left: 10,bottom: 25,top: 25,right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
              bottomRight: Radius.circular(35)),
          color: kPrimaryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({super.key,required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        padding: EdgeInsets.only(left: 10,bottom: 25,top: 25,right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
              bottomRight: Radius.circular(35)),
          color: Colors.orange,
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

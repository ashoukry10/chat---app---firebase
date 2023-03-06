import 'package:flutter/material.dart';
import 'package:untitled5/models/message.dart';
import 'package:untitled5/widget/contans.dart';
import 'package:untitled5/widget/chatBuble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  final _cotroller = ScrollController();
  TextEditingController controller = TextEditingController();
  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy(kCreatedAt).snapshots(),
      builder: (context, snapshot) {
        List<Message> messageList = [];
        for (int i = 0; i < snapshot.data!.docs.length; i++) {
          messageList.add(Message.fromJson(snapshot.data!.docs[i]));
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  kLogo,
                  height: 50,
                ),
                Text('Scholar Chat'),
              ],
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      controller: _cotroller,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) => ChatBuble(
                            message: messageList[index],
                          ))),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data) {
                    message.add({
                      kMessage: data,
                      kCreatedAt: DateTime.now(),
                    });
                    controller.clear();
                    _cotroller.animateTo(_cotroller.position.maxScrollExtent,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                  },
                  decoration: InputDecoration(
                    hintText: 'Send Message',
                    suffixIcon: Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

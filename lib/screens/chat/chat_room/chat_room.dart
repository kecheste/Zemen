// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/chat/chat_room/message_element/message.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  static String routeName = "/chatroom";

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController _messageController = TextEditingController();

  void sendMessage(text) {
    if (text != '') {
      final message =
          Message(text: text, date: DateTime.now(), isSentByMe: true);
      setState(() {
        messages.add(message);
        _messageController.text = '';
      });
    }
  }

  List<Message> messages = [
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: 'What do you mean?',
      date: DateTime.now().subtract(Duration(minutes: 2)),
      isSentByMe: true,
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'Ok lets do it',
      date: DateTime.now().subtract(Duration(minutes: 4)),
      isSentByMe: false,
    ),
  ].reversed.toList();

  String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('John Doe'),
      ),
      body: Center(
        child: Column(children: [
          Expanded(
              child: GroupedListView<Message, DateTime>(
            reverse: true,
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            floatingHeader: true,
            padding: EdgeInsets.all(8),
            elements: messages,
            groupBy: (message) => DateTime(
                message.date.year, message.date.month, message.date.day),
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  color: kPrimaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      DateFormat.yMMMd().format(message.date),
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, Message message) => Align(
              alignment: message.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color:
                        message.isSentByMe ? kPrimaryColor : Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(12),
                        bottomLeft: message.isSentByMe
                            ? Radius.circular(12)
                            : Radius.circular(0),
                        bottomRight: message.isSentByMe
                            ? Radius.circular(0)
                            : Radius.circular(12))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    message.text,
                    style: TextStyle(
                        color:
                            message.isSentByMe ? Colors.white : kPrimaryColor,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          )),
          Container(
            padding: EdgeInsets.all(10),
            child: SizedBox(
                child: TextField(
              controller: _messageController,
              onSubmitted: (text) {
                final message =
                    Message(text: text, date: DateTime.now(), isSentByMe: true);

                setState(() {
                  messages.add(message);
                  _messageController.text = '';
                });
              },
              decoration: InputDecoration(
                  focusColor: kPrimaryColor,
                  fillColor: Color(0xFFF5F6F9),
                  suffixIcon: IconButton(
                      onPressed: () => sendMessage(_messageController.text),
                      icon: Icon(
                        Icons.send,
                        color: kPrimaryColor,
                      )),
                  hintText: 'Enter a message...',
                  hintStyle: TextStyle(color: Color.fromARGB(138, 26, 26, 26)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 4)),
            )),
          ),
        ]),
      ),
    );
  }
}

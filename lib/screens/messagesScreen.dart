import 'package:cat_adoption/model/chatModel.dart';
import 'package:cat_adoption/model/storyModel.dart';
import 'package:cat_adoption/resources/chatData.dart';
import 'package:cat_adoption/resources/color.dart';
import 'package:cat_adoption/screens/chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<StoryModel> stories = [];
  List<ChatModel> chats = [];

  @override
  void initState() {
    super.initState();

    stories = getStories();
    chats = getChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFDEB),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: <Widget>[
                Text(
                  "Messages",
                  style: TextStyle(
                      color: AppColor.dark,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff444446),
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),

          /// now stories
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: 120,
            child: ListView.builder(
                itemCount: stories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StoryTile(
                    imgUrl: stories[index].imgUrl!,
                    username: stories[index].username!,
                  );
                }),
          ),

          /// CHats
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Recent",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Icon(
                            Icons.more_vert,
                            color: Colors.black45,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: chats.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ChatTile(
                              imgUrl: chats[index].imgUrl!,
                              name: chats[index].name!,
                              lastMessage: chats[index].lastMessage!,
                              haveunreadmessages:
                              chats[index].haveunreadmessages!,
                              unreadmessages: chats[index].unreadmessages!,
                              lastSeenTime: chats[index].lastSeenTime!,
                            );
                          }),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class StoryTile extends StatelessWidget {
  final String imgUrl;
  final String username;
  StoryTile({required this.imgUrl, required this.username});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network(
              imgUrl,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            username,
            style: TextStyle(
                color: Color(0xff78778a),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String lastMessage;
  final bool haveunreadmessages;
  final int unreadmessages;
  final String lastSeenTime;
  ChatTile(
      {required this.unreadmessages,
        required this.haveunreadmessages,
        required this.lastSeenTime,
        required this.lastMessage,
        required this.imgUrl,
        required this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> ChatScreen()),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                imgUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    lastMessage,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontFamily: "Neue Haas Grotesk"),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(lastSeenTime),
                  SizedBox(
                    height: 16,
                  ),
                  haveunreadmessages
                      ? Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffff410f),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "$unreadmessages",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ))
                      : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
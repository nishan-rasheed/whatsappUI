import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter3/home_screen/model/messagemodel.dart';
import 'package:flutter3/home_screen/model/model.dart';
import 'package:flutter3/home_screen/pages/chatpage/chat_single.dart';
import 'package:flutter3/home_screen/pages/chatpage/chat_tile.dart';

class ChatdetailsPage extends StatefulWidget {
  ChatdetailsPage({Key? key, required this.data}) : super(key: key);
  Users data;

  @override
  State<ChatdetailsPage> createState() => _ChatdetailsPageState();
}

class _ChatdetailsPageState extends State<ChatdetailsPage> {
  bool showSend = false;

  bool showEmoji = false;

  FocusNode focusNode = FocusNode();

  TextEditingController messageController = TextEditingController();

  List<Message> chats = [
   Message(
     isSend: true,
     isRead: true,
     message: 'hello hgjhjhkklklkk',
     sendAt: "9.45 am",
   ),
    Message(
     isSend: false,
     isRead: true,
     message: 'h',
     sendAt: "9.45 am",
   ),
    Message(
     isSend: true,
     isRead: true,
     message: 'hello hi',
     sendAt: "9.55am",
   ),
   Message(
     isSend: false,
     isRead: true,
     message: 'hello hi',
     sendAt: "9.55am",
   ),
   Message(
     isSend: true,
     isRead: true,
     message: 'helo hi',
     sendAt: "9.55am",
   ),
   Message(
     isSend: false,
     isRead: false,
     message: 'helvhh',
     sendAt: "9.55am",
   ),
Message(
     isSend: true,
     isRead: false,
     message: 'helvhh',
     sendAt: "9.55am",
   ),
    ] ;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        print('hi');
        setState(() {
          showEmoji = false;
        });
      } else {
        print('else');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        titleSpacing: 0,
        backgroundColor: Color(0xFF075E54),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back)),
              CircleAvatar(
                  radius: 20,
                  child: Icon(widget.data.isGroup == true
                      ? Icons.people
                      : Icons.person))
            ],
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.data.name.toString()),
              const Text(
                'last seen, today 6 pm',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        actions: [
          const Icon(Icons.video_call),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.call),
          PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text(widget.data.isGroup == false
                      ? 'view contact'
                      : 'Group info'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text(widget.data.isGroup == false
                      ? 'Media,links and docs'
                      : 'Group media'),
                  value: 2,
                ),
                const PopupMenuItem(
                  child: Text('search'),
                  value: 3,
                ),
                PopupMenuItem(
                  child: Text('mute notification'),
                  value: 4,
                ),
                PopupMenuItem(
                  child: Text('wallpapper'),
                  value: 5,
                ),
                PopupMenuItem(
                  child: Text('more'),
                  value: 6,
                ),
              ];
            },
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/whatsappbg.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            ListView.builder(
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatBubble(data:chats[index] ,);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          // color: Colors.red,
                          // height: 50,
                          width: MediaQuery.of(context).size.width - 70,
                          child: Card(
                            // color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                                onChanged: (value) {
                                  print(value);
                                  if (value.length > 0) {
                                    setState(() {
                                      showSend = true;
                                    });
                                  } else {
                                    setState(() {
                                      showSend = false;
                                    });
                                  }
                                },
                                focusNode: focusNode,
                                controller: messageController,
                                decoration: InputDecoration(
                                    hintText: 'type a message',
                                    prefixIcon: IconButton(
                                        onPressed: () {
                                          focusNode.unfocus();
                                          setState(() {
                                            showEmoji = !showEmoji;
                                          });
                                        },
                                        icon: Icon(showEmoji
                                            ? Icons.keyboard
                                            : Icons.emoji_emotions_outlined)),
                                    suffixIcon: Row(
                                      //  mainAxisAlignment: MainAxisAlignment.,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(context: context, builder:(builder)=>
                                              menu());
                                            },
                                            child:
                                                const Icon(Icons.attach_file)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: Icon(
                                                Icons.camera_alt_outlined)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Icon(Icons.video_call),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: const Color(0xFF075E54),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(showSend ? Icons.send : Icons.mic),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  showEmoji == true ? selectEmoji() : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker(onEmojiSelected: ((emoji, category) {}));
  }

  Widget menu() {
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                  const Icon(Icons.insert_drive_file),
                  Colors.indigo,
                  'Document',
                  () {},
                ),
                 iconWidget(
                  const Icon(Icons.camera_alt),
                  Colors.pink,
                  'Camera',
                  () {},
                ),
                iconWidget(
                  const Icon(Icons.insert_photo),
                  Colors.purple,
                  'Gallery',
                  () {},
                ),
              ],
            ),
            SizedBox(height: 10,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               iconWidget(
                       const Icon(Icons.headset),
                      Colors.orange,
                      'Audio',
                      () {},
                    ),    
                iconWidget(
                   const Icon(Icons.location_on_outlined),
                  Colors.green,
                  'location',
                  () {},
                ),
                iconWidget(
                    Icon(Icons.contact_phone),
                  Colors.blue,
                  'Contact',
                  () {},
                ),
                 ],
           )
          ]),
        ),
      ),
    );
  }

  Widget iconWidget(Icon icon, Color color, String text, Function fun) {
    return GestureDetector(
      onTap: () {
        fun();
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: icon,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}

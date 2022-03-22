
import 'package:flutter/material.dart';
import 'package:flutter3/home_screen/model/model.dart';
import 'package:flutter3/home_screen/pages/chatpage/chat_tile.dart';


class ChatDetails extends StatelessWidget {
   ChatDetails({Key? key}) : super(key: key);

  List<Users> chatList=[
  Users(
    avatar: 'assets/images/profileg1.jpg',
    name: 'vazkaad',
    isGroup: true,
    updateAt:'5',
    message: 'hai',
  ),
  Users(
    avatar: 'assets/images/profile1.jpg',
    name: 'rasheed',
    isGroup: false,
    updateAt:'4',
    message: 'hai there',
  ),
  Users(
    avatar: 'assets/images/profile1.jpg',
    name: 'flutter',
    isGroup: true,
    updateAt:'7',
    message: 'how are',
  ),
  Users(
    avatar: 'assets/images/profile2.jpg',
    name: 'flutter',
    isGroup: true,
    updateAt:'7',
    message: 'how are',
  ),
   Users(
    avatar: '',
    name: 'nishan',
    isGroup: false,
    updateAt:'7',
    message: 'how are',
  ),
   Users(
    avatar: '',
    name: 'malappuram',
    isGroup: true,
    updateAt:'7',
    message: 'how are',
  ),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),

        // backgroundColor: Colors.blue,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (BuildContext context, int index) {
          return  ChatTile(data: chatList[index], );
          
        },
      ),
    );
  }
}












  //  body: Column(
    //    children: [
    //   //    Expanded(
    //   //      child: Container(color: Colors.red,
    //   //      width: 1000,
    //   //      height:MediaQuery.of(context).size.height/2,
    //   //      child: Text('hello'),),
    //   //    ),
    //   //     Container(color: Colors.green,
    //   //    width: 1000,
    //   //    height:MediaQuery.of(context).size.height/2,
    //   //    child: Text('hello'),),
    //   //  ]),
import 'package:flutter/material.dart';
import 'package:flutter3/home_screen/model/model.dart';
import 'package:flutter3/home_screen/pages/chatpage/chat_details_page.dart';

class ChatTile extends StatefulWidget {
  ChatTile({Key? key, required this.data}) : super(key: key);

  Users data;

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => 
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatdetailsPage(data: widget.data,),)),
            leading:  CircleAvatar(              
              backgroundColor: Colors.blue,
              backgroundImage:widget.data.avatar==""?
              AssetImage(widget.data.isGroup==true?
              'assets/images/groupIcon.png':
                'assets/images/profile.jpg')
              :AssetImage(widget.data.avatar.toString())
                          ),
            title:  Text(widget.data.name.toString()),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all,color: Colors.blue,size: 20,),
                const SizedBox(width: 5,),
                Text(widget.data.message.toString()),
                
              ],
              
            ),
            trailing:Text(widget.data.updateAt.toString()),
          );
  }
}
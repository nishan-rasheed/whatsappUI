import 'package:flutter/material.dart';
import 'package:flutter3/home_screen/model/messagemodel.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({Key? key,required this.data}) : super(key: key);

  @override

Message data;
  Widget build(BuildContext context) {
    return Align(
      alignment:data.isSend==true? Alignment.centerRight:
      Alignment.centerLeft,
      child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 80,
              maxWidth: MediaQuery.of(context).size.width - 189),
              child: Card(
                color:data.isSend==true?Color.fromARGB(255, 179, 231, 139) 
                :Color.fromARGB(255, 255, 255, 255),
                child: Stack(
                  children:  [
                     Padding(padding: EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 20),
                    child: Text(data.message.toString(),style: TextStyle(fontSize: 16),),
                    ),
                    Positioned(
                      bottom: 4,left: 2, 
                      child: Row(children: [
                     Text('9.00 am'),
                     Icon(Icons.done_all,size: 15,color: data.isRead==true?Colors.blue:
                     Colors.grey,),
                    ],))
                  ],
                ),
              ),
              ),

    );
  }
}

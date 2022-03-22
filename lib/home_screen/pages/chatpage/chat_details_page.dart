// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter3/home_screen/model/model.dart';
import 'package:flutter3/home_screen/pages/chatpage/chat_tile.dart';


class ChatdetailsPage extends StatefulWidget {
    ChatdetailsPage({Key? key, required this.data}) : super(key: key);
Users data;

  @override
  State<ChatdetailsPage> createState() => _ChatdetailsPageState();
}

class _ChatdetailsPageState extends State<ChatdetailsPage> {
  bool showSend=false;
  bool showEmoji=false;
  FocusNode focusNode=FocusNode();
  TextEditingController messageController=TextEditingController();
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
              GestureDetector(onTap: ()=>
                Navigator.of(context).pop(),
                 child:const Icon(Icons.arrow_back)),
                  CircleAvatar(
                   radius: 20,
                   child: Icon(widget.data.isGroup==true?
                   Icons.people:
                   Icons.person  
                                        )
                 )
            ],
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(widget.data.name.toString()),
              const Text('last seen, today 6 pm',style: TextStyle(fontSize: 15),),
            ],
          ),
        ),
        actions: [
               
                   const Icon(Icons.video_call),
                   const SizedBox(width: 10,),
          const Icon(Icons.call),
          PopupMenuButton(
            onSelected: (value){
              print(value);
            },
            itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(child: Text(widget.data.isGroup==false?
                'view contact':
                'Group info'),value: 1,),
                PopupMenuItem(child: Text(widget.data.isGroup==false?
                'Media,links and docs':
                'Group media'),value: 2,),
                const PopupMenuItem(child: Text('search'),value: 3,),
                PopupMenuItem(child: Text('mute notification'),value: 4,),
                PopupMenuItem(child: Text('wallpapper'),value: 5,),
                PopupMenuItem(child: Text('more'),value: 6,),
                
                
              ];
            },
             )


        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset('assets/images/whatsappbg.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,),
            ListView.builder(
              itemCount:6,
              itemBuilder: (BuildContext context, int index) {
                return Text('hi') ;
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
                          width: MediaQuery.of(context).size.width-70,
                          child:  Card(
                            // color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                print(value);
                                if(value.length>0){

                                
                                setState(() {
                                  showSend=true;
                                  
                                });
                                
                                }
                                else{
                                  setState(() {
                                    showSend=false;
                                  });
                                }
                                
                              },

                              controller:messageController,
                             decoration: InputDecoration(
                               hintText: 'type a message',
                               prefixIcon: IconButton(onPressed: (){
                                 focusNode.unfocus();
                                 setState(() {
                                   showEmoji=!showEmoji;
                                 });
                               },
                               
                                icon: Icon(showEmoji ?Icons.keyboard: Icons.emoji_emotions_outlined)),
                                suffixIcon:Row(
                                  //  mainAxisAlignment: MainAxisAlignment.,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(onTap: (){},
                                     child:const Icon(Icons.attach_file)),
                                     SizedBox(width: 5,),
                                     GestureDetector(onTap: (){},
                                      child: Icon(Icons.camera_alt_outlined)),
                                      SizedBox(width: 5,),
                                      GestureDetector(onTap: (){},
                                      child: Icon(Icons.video_call),),
                                      SizedBox(width: 5,),
                                  ],

                                ) 
                             )
                            ),
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child:  CircleAvatar(
                            radius: 25,
                            backgroundColor:const Color(0xFF075E54),
                            child: IconButton(onPressed: (){}, icon: Icon(showSend ?Icons.send:
                             Icons.mic)),
                          ),
                        )
                      ],
                      
                    ),
                    
                    
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Widget selectEmoji(){

// }
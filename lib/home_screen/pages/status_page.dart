import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter3/home_screen/model/model.dart';

import 'status_tile.dart';
// import 'chat_page.dart';

class StatusDetails extends StatelessWidget {
  StatusDetails({
    Key? key,
  }) : super(key: key);

  List<Users>statusList=[
    Users(
      avatar: '',
      name: 'arun',
      updateAt: 'today,5.25',
    ),
    Users(
      avatar: '',
      name: 'ajay',
      updateAt: 'today,12.25',
    ),
    Users(
      avatar: '',
      name: 'ali',
      updateAt: 'today,5.00',
    ),
    Users(
      avatar: '',
      name: 'anil',
      updateAt: 'today,6.55',
    )
  ];

      @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        
         leading:const CircleAvatar(),
         title:Column(
           children: const [
              Text('My status'),
             Text('time',style:TextStyle(fontSize: 10),
              ),
              SizedBox(height: 20,)
                        ],

                    
         ) ,
       ),
         
                        
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.edit,
            ),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(onPressed: (){},
          child: Icon(Icons.camera_alt_outlined),)
        ],
      ),
      body:ListView.builder(
        itemCount: statusList.length,
        itemBuilder: (BuildContext context, int index) {
          return  StatusTile(data: statusList[index]);
        },
      ),
      );
    
  }
}

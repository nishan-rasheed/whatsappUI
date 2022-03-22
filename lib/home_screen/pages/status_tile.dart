import 'package:flutter/material.dart';
import 'package:flutter3/home_screen/model/model.dart';

class StatusTile extends StatefulWidget {
  StatusTile({Key? key,required this.data}) : super(key: key);
Users data;
  @override
  State<StatusTile> createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading:const CircleAvatar(
            child: Icon(Icons.account_circle),
          ),
          title: Text(widget.data.name.toString()),
          subtitle: Text(widget.data.updateAt.toString()),
          ) ;
      }
}
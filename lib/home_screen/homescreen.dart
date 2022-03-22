import 'package:flutter/material.dart';
import 'package:flutter3/home_screen/model/model.dart';
import 'package:flutter3/home_screen/pages/call_page.dart';
import 'package:flutter3/home_screen/pages/camera_page.dart';
import 'package:flutter3/home_screen/pages/chatpage/chat_page.dart';

import 'package:flutter3/home_screen/pages/status_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {




  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, initialIndex: 1, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF075E54),
          title: const Text('whatsapp'),
                    actions: [
            const Icon(Icons.search),
            PopupMenuButton(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return const [
                  PopupMenuItem(
                    child: Text('New Group'),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text('New broadcast'),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text('Linked devices'),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text('Starred messages'),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Text('Payment'),
                    value: 5,
                  ),
                  PopupMenuItem(
                    child: Text('Settings'),
                    value: 6,
                  ),
                ];
              },
            )
          ],
          bottom: TabBar(
            controller: _controller,
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: 'chats',
              ),
              Tab(
                text: 'status',
              ),
              Tab(
                text: 'calls',
              ),
            ],
          ),
        ),
        body:  TabBarView(
          controller: _controller,
          children: [
            CameraDetails(),
            ChatDetails(),
           StatusDetails(),
            CallDetails(),
          ],
        ));
  }
}

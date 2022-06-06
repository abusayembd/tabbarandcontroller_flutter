// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tabbarandcontroller/pages/first_page.dart';
import 'package:tabbarandcontroller/pages/second_page.dart';
import 'package:tabbarandcontroller/pages/third_page.dart';

void main(List<String> args) {
  runApp(MyTabBar());
}

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tab no : ${controller.index + 1}"),
          centerTitle: true,
          bottom: TabBar(
            controller: controller,
            tabs: [
              Tab(
                text: 'Tab 1',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Tab 2',
                icon: Icon(
                  Icons.star,
                ),
              ),
              Tab(
                text: 'Tab 3',
                icon: Icon(
                  Icons.person,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            FirstPage(),
            SecondPage(),
            ThirdPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 32,
          ),
          onPressed: () {
            controller.animateTo(2);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagram_clone/components/bottom_navbar.dart';

import 'package:instagram_clone/components/timeline_appbar.dart';

import 'package:instagram_clone/components/timeline_stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> get pages => [
        Scaffold(
          appBar: TimelineAppbar(),
          body: Column(children: [TimeLineStories()]),
        ),
        Scaffold(
          body: Center(
            child: Text("Sayfa 2", style: TextStyle(color: Colors.white)),
          ),
        ),
        Scaffold(
          body: Center(
            child: Text("Sayfa 3", style: TextStyle(color: Colors.white)),
          ),
        ),
        Scaffold(
          body: Center(
            child: Text("Sayfa 4", style: TextStyle(color: Colors.white)),
          ),
        ),
        Scaffold(
          body: Center(
            child: Text("Sayfa 5", style: TextStyle(color: Colors.white)),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavbar(
        pageIndex: pageIndex,
        onTap: (int value) {
          setState(() {
            pageIndex = value;
          });
        },
      ),
    );
  }
}

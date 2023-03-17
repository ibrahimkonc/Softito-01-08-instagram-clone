import 'package:flutter/material.dart';
import 'package:instagram_clone/components/bottom_navbar.dart';
import 'package:instagram_clone/components/discovery_grid.dart';
import 'package:instagram_clone/components/timeline_appbar.dart';
import 'package:instagram_clone/providers/create_post_provider.dart';
import 'package:instagram_clone/screens/create_post_screen.dart';
import 'package:instagram_clone/screens/reels_screen.dart';
import 'package:instagram_clone/providers/discovery_grid_provider.dart';
import 'package:provider/provider.dart';

import 'components/timeline_posts.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => DiscoveryGridProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CreatePostProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
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
          appBar: const TimelineAppbar(),
          body: Column(
            children: const [TimelinePosts()],
          ),
        ),
        const DiscoveryGrid(),
        const CreatePostScreen(),
        const VideoApp(),
        const Scaffold(
          body: Center(child: Text("Sayfa 5", style: TextStyle(color: Colors.white))),
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

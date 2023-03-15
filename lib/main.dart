import 'package:flutter/material.dart';
import 'package:instagram_clone/components/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  List<Widget> get pages => const [
        Scaffold(
          body: Center(
            child: Text("Sayfa 1"),
          ),
        ),
        Scaffold(
          body: Center(
            child: Text("Sayfa 2"),
          ),
        ),
        Scaffold(
          body: Center(
            child: Text("Sayfa 3"),
          ),
        ),
        Scaffold(
          body: Center(
            child: Text("Sayfa 4"),
          ),
        ),
        Scaffold(
          body: Center(
            child: Text("Sayfa 5"),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İnstagram"),
      ),
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

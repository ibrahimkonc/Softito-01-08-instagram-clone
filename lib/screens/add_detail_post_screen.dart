import 'package:flutter/material.dart';

class AddDetailPostPage extends StatefulWidget {
  const AddDetailPostPage({super.key});

  @override
  State<AddDetailPostPage> createState() => _AddDetailPostPageState();
}

class _AddDetailPostPageState extends State<AddDetailPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Detail Post'),
      ),
      body: const Center(
        child: Text('Add Detail Post'),
      ),
    );
  }
}

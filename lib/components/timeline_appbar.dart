import 'package:flutter/material.dart';
import 'package:instagram_clone/components/notifications.dart';
import 'package:instagram_clone/screens/chat_screen.dart';

import 'custom_icon_button.dart';

class TimelineAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TimelineAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(65);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Padding(
        padding: const EdgeInsets.only(left: 5, top: 10.0),
        child: Image.asset(
          "assets/instagram.png",
          height: 40,
          fit: BoxFit.fitHeight,
        ),
      ),
      actions: [
        CustomIconButton(
          icon: "assets/icons/favorite.png",
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Notifications()));
          },
          height: 25,
          width: 25,
        ),
        CustomIconButton(
          icon: "assets/icons/message.png",
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatPage()));
          },
          height: 25,
          width: 25,
        )
      ],
    );
  }
}

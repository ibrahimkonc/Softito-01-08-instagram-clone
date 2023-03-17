
import 'package:flutter/material.dart';
import 'package:instagram_clone/components/notifications.dart';

import 'custom_icon_button.dart';

class TimelineAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TimelineAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(65);
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
          onPressed: () {},
          height: 25,
          width: 25,
        )
      ],
    );
  }
}

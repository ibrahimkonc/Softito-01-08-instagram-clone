import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.only(left: 10, top: 10.0),
        child: Image.asset(
          "assets/instagram.png",
          height: 30,
          fit: BoxFit.fitHeight,
        ),
      ),
      actions: [
        CustomIconButton(
          icon: "assets/icons/add.png",
          onPressed: () {},
        ),
        CustomIconButton(
          icon: "assets/icons/message.png",
          onPressed: () {},
        )
      ],
    );
  }
}

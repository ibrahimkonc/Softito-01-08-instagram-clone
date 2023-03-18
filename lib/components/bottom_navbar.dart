// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbar extends StatelessWidget {
  final int pageIndex;
  final Function(int value) onTap;
  const BottomNavbar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: pageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      fixedColor: Colors.white,
      showSelectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: _buttonSize,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: _buttonSize,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              size: _buttonSize,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/videoImage.svg",
              height: 33,
              color: pageIndex == 3 ? Colors.white : Colors.grey,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin,
              size: _buttonSize,
            ),
            label: ""),
      ],
    );
  }

  final double _buttonSize = 40.0;
}

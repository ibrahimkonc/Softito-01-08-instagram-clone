import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/custom_icon_button.dart';

class CreateStoryPage extends StatelessWidget {
  const CreateStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    icon: "assets/icons/ic_Vector.png",
                    onPressed: () {},
                    height: 25,
                    width: 25,
                  ),
                  CustomIconButton(
                    icon: "assets/icons/ic_flash.png",
                    onPressed: () {},
                    height: 25,
                    width: 25,
                  ),
                  CustomIconButton(
                    icon: "assets/icons/ic_cancel.png",
                    onPressed: () {},
                    height: 25,
                    width: 25,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        icon: "assets/icons/ic_Aa.png",
                        onPressed: () {},
                        height: 25,
                        width: 25,
                      ),
                      CustomIconButton(
                        icon: "assets/icons/ic_infinity.png",
                        onPressed: () {},
                        height: 25,
                        width: 25,
                      ),
                      CustomIconButton(
                        icon: "assets/icons/ic_layout.png",
                        onPressed: () {},
                        height: 30,
                        width: 30,
                      ),
                      CustomIconButton(
                        icon: "assets/icons/ic_bottom.png",
                        onPressed: () {},
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      icon: "assets/icons/ic_Ellipse.png",
                      onPressed: () {},
                      height: 60,
                      width: 60,
                    ),
                    CustomIconButton(
                      icon: "assets/icons/ic_Ellipse.png",
                      onPressed: () {},
                      height: 60,
                      width: 60,
                    ),
                    CustomIconButton(
                      icon: "assets/icons/ic_camerabutton.png",
                      onPressed: () {},
                      height: 75,
                      width: 75,
                    ),
                    CustomIconButton(
                      icon: "assets/icons/ic_Ellipse.png",
                      onPressed: () {},
                      height: 60,
                      width: 60,
                    ),
                    CustomIconButton(
                      icon: "assets/icons/ic_Ellipse.png",
                      onPressed: () {},
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

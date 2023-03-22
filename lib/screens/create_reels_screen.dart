import 'package:flutter/material.dart';

import '../components/custom_icon_button.dart';

class CreateReelsScreen extends StatelessWidget {
  const CreateReelsScreen({super.key});

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
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        icon: "assets/icons/ic_music.png",
                        onPressed: () {},
                        height: 25,
                        width: 25,
                      ),
                      CustomIconButton(
                        icon: "assets/icons/ic_stars.png",
                        onPressed: () {},
                        height: 25,
                        width: 25,
                      ),
                      CustomIconButton(
                        icon: "assets/icons/ic_leftarrow.png",
                        onPressed: () {},
                        height: 25,
                        width: 25,
                      ),
                      CustomIconButton(
                        icon: "assets/icons/ic_15sec.png",
                        onPressed: () {},
                        height: 25,
                        width: 25,
                      ),
                      CustomIconButton(
                        icon: "assets/icons/ic_1x.png",
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
                        icon: "assets/icons/ic_alarm.png",
                        onPressed: () {},
                        height: 20,
                        width: 20,
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

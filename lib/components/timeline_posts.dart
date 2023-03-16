import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/components/custom_icon_button.dart';
import 'package:instagram_clone/components/discovery_grid.dart';
import 'package:instagram_clone/components/timeline_stories.dart';

class TimelinePosts extends StatefulWidget {
  const TimelinePosts({super.key});

  @override
  State<TimelinePosts> createState() => _TimelinePostsState();
}

class _TimelinePostsState extends State<TimelinePosts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TimeLineStories(),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: imageList.length,
                itemBuilder: (context, index) => Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.purple,
                                          Colors.pink,
                                          Colors.orange
                                        ],
                                      ),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      width: 30,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(imageList[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                "username",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            new Spacer(),
                            Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Image(image: NetworkImage(imageList[index])),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          children: [
                            CustomIconButton(
                              icon: "assets/icons/favorite.png",
                              onPressed: () {},
                              height: 23,
                              width: 23,
                            ),
                            CustomIconButton(
                              icon: "assets/icons/comment.png",
                              onPressed: () {},
                              height: 23,
                              width: 23,
                            ),
                            CustomIconButton(
                              icon: "assets/icons/send.png",
                              onPressed: () {},
                              height: 23,
                              width: 23,
                            ),
                            Spacer(),
                            CustomIconButton(
                              icon: "assets/icons/save.png",
                              onPressed: () {},
                              height: 23,
                              width: 23,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                        child: Row(
                          children: [
                            Text(
                              "x like",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 2),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: 'username',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("username");
                                    },
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(text: " "),
                                    TextSpan(
                                        text:
                                            "contentcontentcontentcontentcontentcontent",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal))
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

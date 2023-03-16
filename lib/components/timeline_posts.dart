import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/components/custom_icon_button.dart';
import 'package:instagram_clone/components/timeline_stories.dart';
import 'package:provider/provider.dart';

import '../providers/discovery_grid_provider.dart';

class TimelinePosts extends StatelessWidget {
  const TimelinePosts({super.key});

  @override
  Widget build(BuildContext context) {
    var discoveryProvider = Provider.of<DiscoveryGridProvider>(context);
    discoveryProvider.getUser();
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
                itemCount: discoveryProvider.users.length,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Column(
                              children: [
                                Container(
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
                                        image: NetworkImage(discoveryProvider
                                            .users[index].userAvatar
                                            .toString()),
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
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Text(
                              discoveryProvider.users[index].username
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          new Spacer(),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Image(
                          image: NetworkImage(discoveryProvider
                              .users[index].userAvatar
                              .toString())),
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
                              "${discoveryProvider.users[index].likeCount} likes"
                                  .toString(),
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
                                  text: discoveryProvider.users[index].username
                                      .toString(),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(text: " "),
                                    TextSpan(
                                        text: discoveryProvider
                                            .users[index].content,
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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/discovery_grid_provider.dart';
import 'custom_icon_button.dart';

class SinglePost extends StatelessWidget {
  final String v1;
  final String v2;
  final int v3;
  final String v4;
  final String v5;
  final String v6;
//    discoveryProvider.users[1].username.toString(),
// discoveryProvider.users[1].userAvatar.toString())),
//      "${discoveryProvider.users[1].likeCount} likes"
//discoveryProvider.users[1].username.toString(),
//discoveryProvider.users[1].content,
  const SinglePost({super.key, required this.v1, required this.v2, required this.v3, required this.v4, required this.v5, required this.v6});

  @override
  Widget build(BuildContext context) {
    var discoveryProvider = Provider.of<DiscoveryGridProvider>(context);
    discoveryProvider.getUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          padding: EdgeInsets.only(top: 10),
          icon:
              Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: false,
        title: Text(
          "Gönderiler",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Container(
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
                                  image: NetworkImage(v6.toString()),
                                  fit: BoxFit.cover),
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
                      v1.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
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
                  image: NetworkImage(
                      v2.toString())),
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
                      "${v3} likes"
                          .toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
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
                          text: v4.toString(),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: " "),
                            TextSpan(
                                text: v5.toString(),
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
    );
  }
}

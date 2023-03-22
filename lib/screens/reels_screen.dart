// ignore_for_file: library_private_types_in_public_api, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/video_player.dart';

final List<String> videos = [
  'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
];

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  int videoIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.height;
    final ratio = w / h;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  videoIndex = value;
                });
              },
              itemCount: videos.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Center(
                  child: ReelsVideoPlayer(
                    url: videos[index],
                  ),
                );
              },
            ),
            Column(
              children: [
                SizedBox(
                  height: h / 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: w / 100,
                    ),
                    const Expanded(
                      child: Text(
                        "Reels",
                        style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        height: h / 30,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SvgPicture.asset("assets/icons/ic_camera.svg"),
                        ))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

const whiteText = TextStyle(color: Colors.white);
const iconTextStyles = TextStyle(color: Colors.white, fontWeight: FontWeight.w400);

// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class ReelsVideoPlayer extends StatefulWidget {
  final String url;
  const ReelsVideoPlayer({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<ReelsVideoPlayer> createState() => _ReelsVideoPlayerState();
}

class _ReelsVideoPlayerState extends State<ReelsVideoPlayer> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.url);
    controller.initialize().then((value) {
      controller.play();
    });
    // widget.controller = VideoPlayerController.network(widget.url)
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {
    //       widget.controller.play();
    //     });
    //   });
  }

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.height;
    final ratio = w / h;
    return Stack(
      children: [
        VideoPlayer(
          controller,
        ),
        Column(
          children: [
            Expanded(
              flex: 12,
              child: Container(),
            ),
            Expanded(
              flex: ratio <= 16 / 9 ? 11 : 7,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Expanded(flex: 12, child: Container()),
                        Expanded(
                            flex: 9,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: NetworkImage(""),
                                        ),
                                        SizedBox(
                                          width: w / 100,
                                        ),
                                        const Text(
                                          "superkicks",
                                          style: whiteText,
                                        ),
                                        SizedBox(
                                          width: w / 100,
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            alignment: Alignment.center,
                                            width: w / 9,
                                            height: 27,
                                            child: const Text(
                                              "Follow",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // OutlinedButton(
                                        //     style: ButtonStyle(
                                        //       fixedSize: MaterialStateProperty.all(Size(
                                        //         w / 10,
                                        //         w / 50,
                                        //       )),
                                        //       shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                                        //     ),
                                        //     onPressed: () {},
                                        //     child: const Text(
                                        //       "Follow",
                                        //       style: whiteText,
                                        //     ))
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text:
                                                      "abi bu nasıl oluyor bilen yazsub",
                                                  style: iconTextStyles
                                                      .copyWith(fontSize: 14),
                                                ),
                                                overflow: TextOverflow.visible,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: w / 27,
                                          child: Stack(
                                            children: const <Widget>[
                                              //Change according to your icon
                                              CircleAvatar(
                                                radius: 8.0,
                                                backgroundColor: Colors.white,
                                              ),
                                              Positioned(
                                                left: 5.0,
                                                //Change according to your icon
                                                child: CircleAvatar(
                                                  radius: 8.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Text(
                                          "Liked by yukiscape and 100K others",
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/ic_audio_wave.svg",
                                          color: Colors.white,
                                        ),
                                        const Text(
                                          "post malone - Original audio",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),

                  ///right icons
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: h / 50,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child:
                                SvgPicture.asset("assets/icons/ic_heart.svg"),
                          ),
                          const Text(
                            "100K",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: h / 100,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child:
                                SvgPicture.asset("assets/icons/ic_comment.svg"),
                          ),
                          const Text(
                            "295",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: h / 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: SvgPicture.asset("assets/icons/ic_send.svg"),
                          ),
                          SizedBox(
                            height: h / 100,
                          ),
                          const Icon(
                            Icons.more_vert_sharp,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

const whiteText = TextStyle(color: Colors.white);
const iconTextStyles =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w400);

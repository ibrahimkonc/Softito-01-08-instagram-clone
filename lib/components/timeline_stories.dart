import 'package:flutter/material.dart';

class TimeLineStories extends StatefulWidget {
  const TimeLineStories({super.key});

  @override
  State<TimeLineStories> createState() => _TimeLineStoriesState();
}

class _TimeLineStoriesState extends State<TimeLineStories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
            color: Colors.black,
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("dokundu $index");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      //add colors to colors array
                                      colors: index == 0
                                          ? [Colors.green, Colors.green]
                                          : [
                                              Colors.red,
                                              Colors.yellow,
                                            ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 32,
                                      child: CircleAvatar(
                                        radius: 28,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.network(
                                              "https://media.licdn.com/dms/image/C4D03AQFp9sz7mgmKCA/profile-displayphoto-shrink_800_800/0/1649361367225?e=2147483647&v=beta&t=I3aIGywxu2l6XpPFzRobfzoXgO-sHO4Mly4Y2DQuUt8"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              FittedBox(
                                  child: Text(
                                index != 0 ? "m4ydin" : "Your story",
                                style: const TextStyle(color: Colors.white),
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
      ],
    );
  }
}

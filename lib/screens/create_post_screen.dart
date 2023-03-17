import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/providers/create_post_provider.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../providers/discovery_grid_provider.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    String? selectedFile;
    var discoveryProvider = Provider.of<DiscoveryGridProvider>(context);
    var createPostProvider = Provider.of<CreatePostProvider>(context);

    discoveryProvider.getUser();

    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "New Post",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: false,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              size: 35,
              color: Color(0xff0066FF),
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward,
                size: 35,
                color: Color(0xff0066FF),
              ))
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              snap: true,
              floating: true,
              toolbarHeight: w,
              backgroundColor: Colors.blue,
              actions: [
                Expanded(
                    child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xff4B4B4B),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset("assets/icons/ic_resize.svg"),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Image.network(
                        createPostProvider.selectedFile ??
                            "https://media.licdn.com/dms/image/C4D03AQFp9sz7mgmKCA/profile-displayphoto-shrink_800_800/0/1649361367225?e=2147483647&v=beta&t=I3aIGywxu2l6XpPFzRobfzoXgO-sHO4Mly4Y2DQuUt8",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                )),
              ],
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  height: h / 16,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Gallery",
                            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xff4B4B4B),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset("assets/icons/ic_multiple_photo.svg"),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            backgroundColor: const Color(0xff4B4B4B),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset("assets/icons/ic_camera.svg"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                GridView.custom(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverQuiltedGridDelegate(
                      pattern: [
                        //ilk iki satır solda 4 tane 1x1, sağda 2 tane 2x1
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                      ],
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      childCount: discoveryProvider.users.length,
                      (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("object:${discoveryProvider.users[index].userAvatar}");
                            createPostProvider.changeSelectedFile(discoveryProvider.users[index].userAvatar.toString());
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: ClipRRect(
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: discoveryProvider.users[index].userAvatar.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

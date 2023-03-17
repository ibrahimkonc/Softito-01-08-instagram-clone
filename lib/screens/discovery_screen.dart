import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/components/single_post.dart';
import 'package:instagram_clone/providers/discovery_grid_provider.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class DiscoveryGrid extends StatelessWidget {
  const DiscoveryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var discoveryProvider = Provider.of<DiscoveryGridProvider>(context);
    discoveryProvider.getUser();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              snap: true,
              floating: true,
              expandedHeight: 40,
              backgroundColor: Colors.black,
              actions: [
                Expanded(
                  child: Row(
                    children: [
                      discoveryProvider.onFocus
                          ? Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  discoveryProvider.changetoUnFocus();
                                },
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: TextField(
                            focusNode: discoveryProvider.myFocusNode,
                            onTap: () {
                              discoveryProvider.changetoFocus();
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(-5.0),
                              filled: true,
                              fillColor: Color.fromARGB(255, 31, 31, 31),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              hintText: "Ara",
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon:
                                  const Icon(Icons.search, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: discoveryProvider.onFocus == false
                  ? GridView.custom(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverQuiltedGridDelegate(
                        pattern: [
                          //ilk iki satır solda 4 tane 1x1, sağda 2 tane 2x1
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(2, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          //üçüncü satırda 3 tane 1x1
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          //dördüncü  satırda 3 tane 1x1
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          //beşinci satırda solda 1 2x2 sağda 2 tane 1x1
                          const QuiltedGridTile(2, 2),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          //altıncı satırda 3 tane 1x1
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          //yedinci satırda 3 tane 1x1
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
                              //    discoveryProvider.users[1].username.toString(),
// discoveryProvider.users[1].userAvatar.toString())),
//      "${discoveryProvider.users[1].likeCount} likes"
//discoveryProvider.users[1].username.toString(),
//discoveryProvider.users[1].content,
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SinglePost(
                                  v1: discoveryProvider.users[index].username
                                      .toString(),
                                  v2: discoveryProvider.users[index].userAvatar
                                      .toString(),
                                  v3: discoveryProvider.users[index].likeCount!,
                                  v4: discoveryProvider.users[index].username
                                      .toString(),
                                  v5: discoveryProvider.users[index].content
                                      .toString(),
                                  v6: discoveryProvider.users[index].userAvatar
                                      .toString(),
                                ),
                              ));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: discoveryProvider
                                      .users[index].userAvatar
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ))
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Yakındakiler",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: null,
                                child: const Text("Tümünü gör",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 54, 81, 255),
                                        fontSize: 18)),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: discoveryProvider.users.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 32,
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          discoveryProvider
                                              .users[index].userAvatar
                                              .toString()),
                                    ),
                                  ),
                                  trailing: const Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                    size: 17,
                                  ),
                                  subtitle: Text(
                                      discoveryProvider.users[index].subusername
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.grey)),
                                  title: Text(
                                    discoveryProvider.users[index].username
                                        .toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ));
                            }),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

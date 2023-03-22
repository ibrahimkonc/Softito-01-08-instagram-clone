// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_icon_button.dart';
import '../components/single_post.dart';
import '../providers/discovery_grid_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var discoveryProvider = Provider.of<DiscoveryGridProvider>(context);
    discoveryProvider.getUser();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.only(left: 0)),
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.lock_outline,
                  size: 18,
                  color: Colors.white,
                ),
                SizedBox(width: 6),
                Text(
                  "ibrahim.konc",
                  style: TextStyle(fontSize: 20),
                ),
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            )),
        actions: [
          CustomIconButton(
            icon: "assets/icons/add.png",
            onPressed: () {},
            height: 25,
            width: 25,
          ),
          CustomIconButton(
            icon: "assets/icons/ic_more.png",
            onPressed: () {},
            height: 25,
            width: 25,
          )
        ],
      ),
      body: SafeArea(
          child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Colors.black,
                floating: true,
                pinned: true,
                bottom: _tabbar(),
                toolbarHeight: MediaQuery.of(context).size.height / 1.80,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: _body(
                      discoveryProvider), // This is where you build the profile part
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              _listGrid(discoveryProvider),
              _listGrid(discoveryProvider)
            ],
          ),
        ),
      )),
    );
  }

  Column _body(DiscoveryGridProvider discoveryProvider) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media.licdn.com/dms/image/C4D03AQFp9sz7mgmKCA/profile-displayphoto-shrink_800_800/0/1649361367225?e=2147483647&v=beta&t=I3aIGywxu2l6XpPFzRobfzoXgO-sHO4Mly4Y2DQuUt8"),
                radius: 40,
              ),
            ),
            Expanded(
              child: Column(
                children: const [
                  Text("10",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  Text("Gönderi", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: const [
                  Text("6.968",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  Text("Takipçi", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: const [
                  Text("570",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  Text("Takip", style: TextStyle(color: Colors.white))
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(discoveryProvider.users[0].username.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
                "🇹🇷ⓗⓐⓣⓐⓨ ~ ⓐⓝⓣⓐⓚⓨⓐ🇹🇷 \n 🎓 MKÜ 🎓 \n 💻 ⓟⓒ ⓟⓡⓞⓖⓡⓐⓜⓒⓘⓢⓘ💻\n💻 Html & Css & Php - Jqery - JavaScriptC# - MYSQL - MSSQL - Unity\n @masaustu_uygulamalarim \n ⤵ Web Sitem ⤵ \n www.kontunyazilim.com",
                style: TextStyle(color: Colors.white)),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    backgroundColor: const Color.fromARGB(98, 85, 85, 85),
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                  child: const Text('Profili Düzenle'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    backgroundColor: const Color.fromARGB(98, 85, 85, 85),
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                  child: const Text('Profili Paylaş'),
                ),
              ),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
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
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      //add colors to colors array
                                      colors: [
                                        Color.fromARGB(99, 71, 71, 71),
                                        Color.fromARGB(213, 83, 83, 83),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            discoveryProvider
                                                .users[index].userAvatar
                                                .toString()),
                                        radius: 32,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const FittedBox(
                                  child: Text(
                                "ツ",
                                style: TextStyle(color: Colors.white),
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

  GridView _listGrid(DiscoveryGridProvider discoveryProvider) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2),
        itemCount: discoveryProvider.users.length - 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SinglePost(
                  v1: discoveryProvider.users[index].username.toString(),
                  v2: discoveryProvider.users[index].userAvatar.toString(),
                  v3: discoveryProvider.users[index].likeCount!,
                  v4: discoveryProvider.users[index].username.toString(),
                  v5: discoveryProvider.users[index].content.toString(),
                  v6: discoveryProvider.users[index].userAvatar.toString(),
                ),
              ));
            },
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Image(
                  image: NetworkImage(
                      discoveryProvider.users[index].userAvatar.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        });
  }

  TabBar _tabbar() {
    return TabBar(
        controller: _tabController,
        onTap: (tabindex) {},
        labelPadding: const EdgeInsets.all(5),
        indicatorColor: Colors.grey,
        indicatorWeight: 1,
        padding: const EdgeInsets.all(4),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          ImageIcon(
            AssetImage("assets/icons/ic_multiGalerry.png"),
            size: 23,
          ),
          ImageIcon(
            AssetImage("assets/icons/ic_userImage.png"),
            size: 25,
          ),
        ]);
  }
}

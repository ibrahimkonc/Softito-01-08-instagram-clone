import 'package:flutter/material.dart';
import 'package:instagram_clone/components/single_post.dart';
import 'package:provider/provider.dart';
import '../providers/discovery_grid_provider.dart';

class DiscoverySearchTabs extends StatefulWidget {
  const DiscoverySearchTabs({super.key});

  @override
  State<DiscoverySearchTabs> createState() => _DiscoverySearchTabsState();
}

class _DiscoverySearchTabsState extends State<DiscoverySearchTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var discoveryProvider = Provider.of<DiscoveryGridProvider>(context);
    discoveryProvider.getUser();

    return Scaffold(
      appBar: AppBar(
        shape: const Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
        backgroundColor: Colors.black,
        actions: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: TextField(
                      controller: discoveryProvider.textController,
                      onTap: () {},
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(-5.0),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 31, 31, 31),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black),
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
        bottom: TabBar(
            onTap: (tabindex) {
              setState(() {
                _tabController.index = tabindex;
              });
            },
            indicatorColor: const Color.fromARGB(255, 255, 255, 255),
            indicatorWeight: 1,
            padding: const EdgeInsets.all(2),
            labelPadding: const EdgeInsets.all(10),
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Text("Başlıca", style: TextStyle(fontSize: 16)),
              Text("Hesaplar", style: TextStyle(fontSize: 16)),
              Text("Etiketler", style: TextStyle(fontSize: 16)),
              Text("Yerler", style: TextStyle(fontSize: 16)),
            ]),
      ),
      body: TabBarView(controller: _tabController, children: [
        _baslica(discoveryProvider),
        _hesaplar(discoveryProvider),
        _etiketler(discoveryProvider),
        _yerler(discoveryProvider),
      ]),
    );
  }

  ListView _yerler(DiscoveryGridProvider discoveryProvider) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: discoveryProvider.users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    //add colors to colors array
                    colors: [
                      Color.fromARGB(255, 41, 41, 41),
                      Color.fromARGB(255, 23, 23, 23)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 32,
                    child: Icon(Icons.location_on_outlined),
                  ),
                ),
              ),
              subtitle: Text(
                  discoveryProvider.users[index].subusername.toString(),
                  style: const TextStyle(color: Colors.grey)),
              title: Text(
                "${discoveryProvider.textController.text}, Istanbul, Turkey",
                style: const TextStyle(color: Colors.white),
              ));
        });
  }

  ListView _etiketler(DiscoveryGridProvider discoveryProvider) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: discoveryProvider.users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    //add colors to colors array
                    colors: [
                      Color.fromARGB(255, 41, 41, 41),
                      Color.fromARGB(255, 23, 23, 23)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 32,
                    child: Icon(Icons.tag),
                  ),
                ),
              ),
              subtitle: Text(
                  discoveryProvider.users[index].subusername.toString(),
                  style: const TextStyle(color: Colors.grey)),
              title: Text(
                "#${discoveryProvider.textController.text}",
                style: const TextStyle(color: Colors.white),
              ));
        });
  }

  ListView _hesaplar(DiscoveryGridProvider discoveryProvider) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: discoveryProvider.users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    //add colors to colors array
                    colors: index % 2 == 0
                        ? [
                            const Color.fromARGB(255, 175, 76, 130),
                            Colors.red,
                            Colors.yellow,
                          ]
                        : [Colors.black, Colors.black],
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
                      radius: 30,
                      backgroundImage: NetworkImage(
                          discoveryProvider.users[index].userAvatar.toString()),
                    ),
                  ),
                ),
              ),
              subtitle: Text(discoveryProvider.users[index].username.toString(),
                  style: const TextStyle(color: Colors.grey)),
              title: Text(
                discoveryProvider.textController.text.toString(),
                style: const TextStyle(color: Colors.white),
              ));
        });
  }

  GridView _baslica(DiscoveryGridProvider discoveryProvider) {
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
}

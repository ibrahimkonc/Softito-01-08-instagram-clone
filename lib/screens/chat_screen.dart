import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_icon_button.dart';
import '../providers/discovery_grid_provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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
        title: Padding(
          padding: EdgeInsets.only(left: 0, top: 10.0),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              child: Row(
                children: const [
                  Text(
                    "ibrahim.konc",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded)
                ],
              )),
        ),
        actions: [
          CustomIconButton(
            icon: "assets/icons/ic_camera.png",
            onPressed: () {},
            height: 25,
            width: 25,
          ),
          CustomIconButton(
            icon: "assets/icons/ic_add.png",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatPage()));
            },
            height: 25,
            width: 25,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: TextField(
                onTap: () {},
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(-5.0),
                  filled: true,
                  fillColor: Color.fromARGB(255, 31, 31, 31),
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
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                color: Colors.black,
                height: 125,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: discoveryProvider.users.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          print("dokundu $index");
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 42,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  discoveryProvider
                                                      .users[index].userAvatar
                                                      .toString()),
                                              radius: 48,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              Color.fromARGB(239, 58, 58, 58),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 12),
                                        child: Text(
                                          index == 0
                                              ? "+"
                                              : discoveryProvider
                                                  .users[index].username
                                                  .toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  FittedBox(
                                      child: Text(
                                    index == 0
                                        ? "Bir Not Burak"
                                        : discoveryProvider
                                            .users[index].username
                                            .toString(),
                                    style: const TextStyle(color: Colors.grey),
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Mesajlar",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: null,
                    child: const Text("İstekler",
                        style: TextStyle(
                            color: Color.fromARGB(255, 54, 81, 255),
                            fontSize: 18)),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: discoveryProvider.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(discoveryProvider
                              .users[index].userAvatar
                              .toString()),
                        ),
                        trailing: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                        subtitle: Text(
                            discoveryProvider.users[index].subusername
                                .toString(),
                            style: const TextStyle(color: Colors.grey)),
                        title: Text(
                          discoveryProvider.users[index].username.toString(),
                          style: const TextStyle(color: Colors.white),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

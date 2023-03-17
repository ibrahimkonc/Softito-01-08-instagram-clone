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
                children: [
                  Text("ibrahim.konc"),
                  Icon(Icons.keyboard_arrow_down_rounded)
                ],
              )),
        ),
        actions: [
          CustomIconButton(
            icon: "assets/icons/favorite.png",
            onPressed: () {},
            height: 25,
            width: 25,
          ),
          CustomIconButton(
            icon: "assets/icons/message.png",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatPage()));
            },
            height: 25,
            width: 25,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
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
          ),
          Expanded(
            flex: 2,
            child: Container(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
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
          ),
          Expanded(
            flex: 10,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: discoveryProvider.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 32,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(discoveryProvider
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
                          discoveryProvider.users[index].subusername.toString(),
                          style: const TextStyle(color: Colors.grey)),
                      title: Text(
                        discoveryProvider.users[index].username.toString(),
                        style: const TextStyle(color: Colors.white),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}

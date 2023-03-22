import 'package:flutter/material.dart';

import 'package:instagram_clone/providers/discovery_grid_provider.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    var discoveryProvider = Provider.of<DiscoveryGridProvider>(context);
    discoveryProvider.getUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 10),
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: false,
        title: const Text(
          "Bildirimler",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          discoveryProvider.users[8].userAvatar.toString()),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red),
                    width: 18,
                    height: 18,
                    child: const FittedBox(
                        child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "43",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                ],
              ),
              title: const Text(
                "Takip İstekleri",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("İstekleri onayla veya yok say",
                  style: TextStyle(color: Colors.grey)),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text(
                    "Bugün",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: discoveryProvider.users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(discoveryProvider
                              .users[index].userAvatar
                              .toString()),
                        ),
                        title: Wrap(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.53,
                              child: RichText(
                                text: TextSpan(
                                    text: discoveryProvider
                                        .users[index].username
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      const TextSpan(text: " "),
                                      index % 5 == 0
                                          ? const TextSpan(
                                              text: "fotoğrafını beğendi",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal))
                                          : const TextSpan(
                                              text:
                                                  "seni takip etmeye başladı.",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                      const TextSpan(
                                          text: " 1g",
                                          style: TextStyle(color: Colors.grey)),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        trailing: index % 5 == 0
                            ? SizedBox(
                                width: 50,
                                child: Image.network(
                                  discoveryProvider.users[index].userAvatar
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    fixedSize: index % 3 == 0
                                        ? const Size(90, 20)
                                        : const Size(70, 15),
                                    backgroundColor: index % 3 == 0
                                        ? null
                                        : const Color(0xFF262626),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7))),
                                child: FittedBox(
                                  child: Text(
                                    index % 3 == 0 ? "Takip et" : "Takip",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: avoid_print, unused_local_variable

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/components/kaydir_dumen.dart';
import 'package:instagram_clone/providers/create_post_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import '../providers/discovery_grid_provider.dart';
import 'add_detail_post_screen.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  bool isMultiple = false;
  String? selectedFile;
  File? imageCamera;
  Uint8List? imageGallery;
  List<Widget> imageList = [];
  int currentPage = 0;
  int? lastPage;
  @override
  void initState() {
    super.initState();
    fetchAllImages();
  }

  handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent <= .33) {
      return;
    }
    if (lastPage == currentPage) {
      return;
    }
    fetchAllImages();
  }

  fetchAllImages() async {
    lastPage = currentPage;
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      return PhotoManager.openSetting();
    }
    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      onlyAll: true,
      // ignore: todo
      //TODO: video için bunu sil
      // type: RequestType.image,
    );
    List<AssetEntity> photos =
        await albums[0].getAssetListPaged(page: currentPage, size: 100);
    List<Widget> temp = [];

    for (AssetEntity asset in photos) {
      temp.add(
        FutureBuilder(
            future: asset.thumbnailDataWithSize(
              ThumbnailSize(asset.width, asset.height),
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (snapshot.connectionState == ConnectionState.done) {
                        imageGallery = snapshot.data as Uint8List;
                        imageCamera = null;
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          image: DecorationImage(
                            image: MemoryImage(snapshot.data as Uint8List),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (asset.type == AssetType.video)
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 5, bottom: 5),
                            child: Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
      );
    }
    setState(() {
      imageList.addAll(temp);
      currentPage++;
    });
  }

  pickmageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        imageCamera = File(image!.path);
        imageGallery = null;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var discoveryProvider = Provider.of<DiscoveryGridProvider>(context);
    var createPostProvider = Provider.of<CreatePostProvider>(context);
    discoveryProvider.getUser();
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    final tranformController = TransformationController();

    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "New Post",
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                size: 35,
                color: Color(0xff0066FF),
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddDetailPostPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 35,
                  color: Color(0xff0066FF),
                ))
          ],
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        handleScrollEvent(notification);
                        return true;
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: CustomScrollView(
                              slivers: [
                                SliverAppBar(
                                  backgroundColor: Colors.transparent,
                                  pinned: false,
                                  snap: false,
                                  floating: true,
                                  toolbarHeight: w,
                                  actions: [
                                    Column(
                                      children: [
                                        Expanded(
                                            child: Stack(
                                          children: [
                                            Container(
                                              height: w,
                                              width: w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.red,
                                                    width: 1),
                                              ),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                      width: w,
                                                      child: InteractiveViewer(
                                                        transformationController:
                                                            tranformController,
                                                        minScale: 0.5,
                                                        maxScale: 4,
                                                        child: imageCamera !=
                                                                    null ||
                                                                imageGallery !=
                                                                    null
                                                            ? imageGallery !=
                                                                    null
                                                                ? Image.memory(
                                                                    imageGallery!)
                                                                : Image.file(
                                                                    imageCamera!)
                                                            : const Image(
                                                                image: AssetImage(
                                                                    "assets/instagram.png"),
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  tranformController.value =
                                                      Matrix4.identity();
                                                },
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 8.0,
                                                            left: 8),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          const Color(
                                                              0xff4B4B4B),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: SvgPicture.asset(
                                                            "assets/icons/ic_resize.svg"),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                                SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: h / 16,
                                        color: Colors.black,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: const [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Gallery",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isMultiple = !isMultiple;
                                                    });
                                                  },
                                                  child: CircleAvatar(
                                                    backgroundColor: isMultiple
                                                        ? const Color(
                                                            0xff4B4B4B)
                                                        : Colors.blue,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: SvgPicture.asset(
                                                          "assets/icons/ic_multiple_photo.svg"),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    pickmageFromCamera();
                                                  },
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        const Color(0xff4B4B4B),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: SvgPicture.asset(
                                                          "assets/icons/ic_camera.svg"),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SliverGrid(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 2,
                                            mainAxisSpacing: 2),
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        return imageList[index];
                                      },
                                      childCount: imageList.length,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                SizedBox(height: 50, child: CenteredPageView()),
              ],
            )
          ],
        ));
  }
}

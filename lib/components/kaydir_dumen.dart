import 'package:flutter/material.dart';

class CenteredPageView extends StatefulWidget {
  const CenteredPageView({super.key});

  @override
  _CenteredPageViewState createState() => _CenteredPageViewState();
}

class _CenteredPageViewState extends State<CenteredPageView> {
  late PageController pageController;
  late int currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    //currentPageIndex = 0;
    pageController = PageController(
      initialPage: currentPageIndex,
      viewportFraction: 0.3,
    )..addListener(() {
        setState(() {
          currentPageIndex = pageController.page!.round();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      GestureDetector(
        onTap: () {
          setState(() {
            currentPageIndex = 0;
            pageController.animateToPage(
              currentPageIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          });
        },
        child: Center(
          child: FittedBox(
            child: Text(
              "GÖNDERİ",
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    currentPageIndex == 0 ? FontWeight.bold : FontWeight.normal,
                color: currentPageIndex == 0 ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            currentPageIndex = 1;
            pageController.animateToPage(
              currentPageIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          });
        },
        child: Center(
          child: FittedBox(
            child: Text(
              "HİKAYE",
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    currentPageIndex == 1 ? FontWeight.bold : FontWeight.normal,
                color: currentPageIndex == 1 ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            currentPageIndex = 2;
            pageController.animateToPage(
              currentPageIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          });
        },
        child: Center(
          child: FittedBox(
            child: Text(
              "REELS",
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    currentPageIndex == 2 ? FontWeight.bold : FontWeight.normal,
                color: currentPageIndex == 2 ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            currentPageIndex = 3;
            pageController.animateToPage(
              currentPageIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          });
        },
        child: Center(
          child: FittedBox(
            child: Text(
              "CANLI",
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    currentPageIndex == 3 ? FontWeight.bold : FontWeight.normal,
                color: currentPageIndex == 3 ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    ];
    return Padding(
      padding: EdgeInsets.only(left: currentPageIndex != 0 ? 0 : 100),
      child: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: currentPageIndex == 0
                              ? const Radius.circular(100)
                              : const Radius.circular(0)),
                      // .circular(
                      //     currentPageIndex != 0 ? 0 : 100),
                      color: Colors.black,
                      border: Border.all(width: 1, color: Colors.black)),
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: PageView(
                          controller: pageController,
                          children: pages,
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 50,
                // ),

                // alttaki hangi sayfada olduğunu gösteren noktalar

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: List.generate(
                //     pages.length,
                //     (index) => Container(
                //       width: 10,
                //       height: 10,
                //       margin: const EdgeInsets.symmetric(horizontal: 5),
                //       decoration: BoxDecoration(
                //         color: currentPageIndex == index
                //             ? Colors.blue
                //             : Colors.grey,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            IgnorePointer(
              ignoring: true,
              child: Center(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.45),
                        Colors.black.withOpacity(0.2),
                        Colors.transparent,
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.45),
                        Colors.black.withOpacity(0.8),
                        Colors.black,
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

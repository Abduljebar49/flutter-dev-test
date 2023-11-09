import 'package:dev_test/funtions/constant.dart';
import 'package:dev_test/widgets/bottomsheet.dart';
import 'package:dev_test/widgets/header.dart';
import 'package:dev_test/widgets/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool showFullCaptionText = false;
  bool hideItems = false;
  bool showMenu = false;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var text =
      "Lorem ipsum dolor sit amet consectetur. Eget aenean integer amet sapien arcu urna turpis amet elementum. A nec euismod in quam venenatis. Consectetur et nunc amet mattis dui imperdiet tempus. Et aliquet gravida posuere pretium donec diam nibh sed. Pharetra non vitae urna aliquet egestas. Phasellus at id adipiscing eget. Lorem volutpat dolor lorem pharetra nunc duis lorem integer. Magna in pellentesque pretium elementum suspendisse tincidunt fermentum praesent.";

  @override
  Widget build(BuildContext context) {
    double appBarHeight = 58.0;
    double defaultHeight = Get.height - appBarHeight;
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  if (showMenu) {
                    setState(() {
                      showMenu = false;
                    });
                  }
                },
                child: Image.asset(
                  'assets/images/background.png',
                  width: Get.width,
                  height: defaultHeight,
                  fit: BoxFit.fill,
                ),
              ),

              //Menu list
              showMenu ? const MenuList() : Container(),

              //Menu icon
              !hideItems && !showMenu
                  ? Positioned(
                      top: 18,
                      left: 22,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            setState(() {
                              showMenu = true;
                            });
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/menu.svg',
                          width: 27,
                          height: 24,
                          // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                      ),
                    )
                  : Container(),

              //Hide icon
              !hideItems
                  ? Positioned(
                      bottom: 81,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            hideItems = true;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/forward.svg',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    )
                  : Container(),

              //Show Icon
              hideItems
                  ? Positioned(
                      bottom: 81,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            hideItems = false;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/backward.svg',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    )
                  : Container(),

              //Caption text UI
              !hideItems ? captionText() : Container(),

              // side icons
              !hideItems
                  ? Positioned(
                      bottom: 157,
                      right: 20,
                      width: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 15,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/profile.png', // Replace with the path to your asset
                                width: 30,
                                height: 30,
                                fit: BoxFit
                                    .cover, // Adjust the fit property as needed
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: SvgPicture.asset(
                              'assets/icons/book.svg',
                              width: 28,
                              height: 28,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                                  builder: (BuildContext context) {
                                    return DraggableScrollableSheet(
                                        expand: false,
                                        initialChildSize:
                                            0.75, // Initial height as a fraction of screen height
                                        builder: (BuildContext context,
                                            ScrollController scrollController) {
                                          return const CommentsBottomSheet();
                                        });
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/message_home.svg',
                                    width: 28,
                                    height: 28,
                                  ),
                                  const Text(
                                    '45k',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/heart.svg',
                                  width: 30,
                                  height: 28,
                                ),
                                const Text(
                                  '45k',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/share.svg',
                            width: 28,
                            height: 28,
                          ),
                        ],
                      ),
                    )
                  : Container(),

              //bottom navigation bar
              !hideItems
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 72,
                      child: SizedBox(
                        height: 72,
                        child: bottomNavigationBar(),
                      ),
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF2E2E2E),
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              'assets/icons/apps.svg',
              colorFilter: ColorFilter.mode(
                  getActiveColor(0, _selectedIndex), BlendMode.srcIn),
            ),
          ),
          label: 'Apps',
        ),
        BottomNavigationBarItem(
          icon: badges.Badge(
            badgeContent: const Text(
              '25',
              style: TextStyle(fontSize: 8, color: Colors.white),
            ),
            child: SvgPicture.asset(
              'assets/icons/qucon.svg',
              colorFilter: ColorFilter.mode(
                  getActiveColor(1, _selectedIndex), BlendMode.srcIn),
            ),
          ),
          label: 'Qucon',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/zaady.svg',
            colorFilter: ColorFilter.mode(
                getActiveColor(2, _selectedIndex), BlendMode.srcIn),
          ),
          label: 'Zaady',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/organize.svg',
            colorFilter: ColorFilter.mode(
                getActiveColor(3, _selectedIndex), BlendMode.srcIn),
          ),
          label: 'Organize',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/profile_icon.svg',
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(
                getActiveColor(4, _selectedIndex), BlendMode.srcIn),
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.white,
      onTap: _onItemTapped,
    );
  }

  Widget captionText() {
    return Positioned(
      bottom: 81,
      left: 20,
      right: 65,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(76, 66, 67, 0.66),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 13,
              left: 21,
              right: 14,
            ),
            child: Column(
              children: [
                showFullCaptionText
                    ? Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(
                          bottom: 4,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              showFullCaptionText = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                '...Less',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF2CCAA0),
                                ),
                              ),
                              Image.asset(
                                'assets/icons/less.png',
                                width: 17,
                                height: 17,
                                // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(),
                Text(
                  getEditedText(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              left: 21,
              right: 14,
              bottom: 18,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '27 Oct. 2020 @5:23pm',
                    style: TextStyle(
                      color: Color(0xFFE5A5A5),
                      fontSize: 12,
                    ),
                  ),
                  text.length > 150 && !showFullCaptionText
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showFullCaptionText = true;
                                });
                              },
                              child: const Text(
                                '...More',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF2CCAA0),
                                ),
                              ),
                            ),
                            Image.asset(
                              'assets/images/moree.png',
                              width: 17,
                              height: 17,
                              // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            )
                          ],
                        )
                      : Container(),
                ]),
          )
        ]),
      ),
    );
  }

  getEditedText() {
    if (showFullCaptionText) {
      return text;
    }
    return text.substring(1, text.length > 150 ? 150 : text.length);
  }
}

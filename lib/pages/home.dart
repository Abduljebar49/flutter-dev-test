import 'package:dev_test/funtions/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool showFullCaptionText = false;
  bool hideItems = true;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var text =
      "Lorem ipsum dolor sit amet consectetur. Eget aenean integer amet sapien arcu urna turpis amet elementum. A nec euismod in quam venenatis. Consectetur et nunc amet mattis dui imperdiet tempus. Et aliquet gravida posuere pretium donec diam nibh sed. Pharetra non vitae urna aliquet egestas. Phasellus at id adipiscing eget. Lorem volutpat dolor lorem pharetra nunc duis lorem integer. Magna in pellentesque pretium elementum suspendisse tincidunt fermentum praesent.";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    double appBarHeight = 55.0;
    double defaultHeight = height - appBarHeight;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 25,
                bottom: 5,
              ),
              padding: EdgeInsets.only(left: 25, right: 42),
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/top_icon.png',
                        width: 25,
                        height: 25,
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text('SeeQul')),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 32, right: 42),
                        child: SvgPicture.asset(
                          'assets/svg/top_search.svg',
                          width: 18,
                          height: 18,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/svg/top_group.svg',
                        width: 18,
                        height: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/background.png',
                    width: width,
                    height: defaultHeight,
                    fit: BoxFit.fill,
                  ),

                  Positioned(
                    top: 18,
                    left: 22,
                    child: SvgPicture.asset(
                      'assets/svg/menu.svg',
                      width: 27,
                      height: 24,
                      // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),

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
                              'assets/svg/forward.svg',
                              width: 70,
                              height: 70,
                            ),
                          ),
                        )
                      : Container(),
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
                              'assets/svg/backward.svg',
                              width: 70,
                              height: 70,
                            ),
                          ),
                        )
                      : Container(),
                  //Caption text UI
                  !hideItems
                      ? Positioned(
                          bottom: 81,
                          left: 20,
                          right: 65,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(76, 66, 67, 0.66),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
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
                                                width: width,
                                                margin: EdgeInsets.only(
                                                  bottom: 4,
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      showFullCaptionText =
                                                          false;
                                                    });
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '...Less',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Color(0xFF2CCAA0),
                                                        ),
                                                      ),
                                                      SvgPicture.asset(
                                                        'assets/svg/less.svg',
                                                        width: 17,
                                                        height: 17,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        Text(
                                          getEditedText(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '27 Oct. 2020 @5:23pm',
                                            style: TextStyle(
                                              color: Color(0xFFE5A5A5),
                                              fontSize: 12,
                                            ),
                                          ),
                                          text.length > 150 &&
                                                  !showFullCaptionText
                                              ? Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          showFullCaptionText =
                                                              true;
                                                        });
                                                      },
                                                      child: Text(
                                                        '...More',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Color(0xFF2CCAA0),
                                                        ),
                                                      ),
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/svg/more.svg',
                                                      width: 17,
                                                      height: 17,
                                                    )
                                                  ],
                                                )
                                              : Container(),
                                        ]),
                                  )
                                ]),
                          ),
                        )
                      : Container(),
                  !hideItems
                      ? Positioned(
                          bottom: 157,
                          right: 20,
                          width: 30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
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
                                margin: EdgeInsets.only(bottom: 15),
                                child: SvgPicture.asset(
                                  'assets/svg/book.svg',
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/message.svg',
                                      width: 28,
                                      height: 28,
                                    ),
                                    Text(
                                      '45k',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/heart.svg',
                                      width: 30,
                                      height: 28,
                                    ),
                                    Text(
                                      '45k',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: SvgPicture.asset(
                                  'assets/svg/share.svg',
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),

                  !hideItems
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: 72,
                          child: SizedBox(
                            height: 72,
                            child: BottomNavigationBar(
                              // backgroundColor: Colors.black,
                              backgroundColor: Color(0xFF2E2E2E),
                              type: BottomNavigationBarType.fixed,
                              items: <BottomNavigationBarItem>[
                                BottomNavigationBarItem(
                                  icon: Container(
                                    margin: EdgeInsets.all(4),
                                    child: SvgPicture.asset(
                                      'assets/svg/apps.svg',
                                      colorFilter: ColorFilter.mode(
                                          getActiveColor(0, _selectedIndex),
                                          BlendMode.srcIn),
                                    ),
                                  ),
                                  label: 'Apps',
                                ),
                                BottomNavigationBarItem(
                                  icon: SvgPicture.asset(
                                    'assets/svg/qucon.svg',
                                    colorFilter: ColorFilter.mode(
                                        getActiveColor(1, _selectedIndex),
                                        BlendMode.srcIn),
                                  ),
                                  label: 'Qucon',
                                ),
                                BottomNavigationBarItem(
                                  icon: SvgPicture.asset(
                                    'assets/svg/zaady.svg',
                                    colorFilter: ColorFilter.mode(
                                        getActiveColor(2, _selectedIndex),
                                        BlendMode.srcIn),
                                  ),
                                  label: 'Zaady',
                                ),
                                BottomNavigationBarItem(
                                  icon: SvgPicture.asset(
                                    'assets/svg/organize.svg',
                                    colorFilter: ColorFilter.mode(
                                        getActiveColor(3, _selectedIndex),
                                        BlendMode.srcIn),
                                  ),
                                  label: 'Organize',
                                ),
                                BottomNavigationBarItem(
                                  icon: SvgPicture.asset(
                                    'assets/svg/profile_icon.svg',
                                    width: 28,
                                    height: 28,
                                    colorFilter: ColorFilter.mode(
                                        getActiveColor(4, _selectedIndex),
                                        BlendMode.srcIn),
                                  ),
                                  label: 'Profile',
                                ),
                              ],
                              currentIndex: _selectedIndex,
                              selectedItemColor: Colors.amber[800],
                              unselectedItemColor: Colors.white,
                              onTap: _onItemTapped,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
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

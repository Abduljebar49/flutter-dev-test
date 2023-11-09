import 'package:dev_test/funtions/constant.dart';
import 'package:dev_test/pages/home.dart';
import 'package:dev_test/widgets/emoji_tile.dart';
import 'package:dev_test/widgets/header.dart';
import 'package:dev_test/widgets/reply_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReplyPage extends StatefulWidget {
  const ReplyPage({super.key});

  @override
  State<ReplyPage> createState() => _ReplyPageState();
}

class _ReplyPageState extends State<ReplyPage> {
  bool showEmojis = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 25,
            ),
            child: GestureDetector(
              onTap: () {
                if (showEmojis) {
                  setState(() {
                    showEmojis = false;
                  });
                } else {
                  Get.to(() => const HomePage());
                }
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  const Text(
                    'Reply',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          !showEmojis ? replyHomeWidget(width) : Container(),
          showEmojis
              ? Expanded(
                  child: showEmojiPicker(width),
                )
              : Container(),
          Expanded(child: Container())
        ],
      ),
    );
  }

  showEmojiPicker(width) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: const EdgeInsets.only(
        top: 5,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 15, bottom: 20),
          child: Center(
            child: SizedBox(
              width: width * 0.3,
              height: 30,
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: 'Search Emoji',
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 20,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 0, // No horizontal spacing
                mainAxisSpacing: 0, // No vertical spacing
              ),
              itemCount: emojis.length,
              itemBuilder: (context, index) {
                return EmojiTile(emoji: emojis[index]);
              },
            ),
          ),
        )
      ]),
    );
  }

  Widget replyHomeWidget(width) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: ReplayCommentWidget(
            comment: comment,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/profile.png', // Replace with the path to your asset
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover, // Adjust the fit property as needed
                ),
              ),
              Container(
                width: width * .36,
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    prefixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          showEmojis = true;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '😃',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ), // Icon at the beginning
                    suffixIcon: const Icon(
                      Icons.send,
                      color: Colors.blue,
                      size: 30,
                    ), // Icon at the end
                    hintText: 'Add reply',
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

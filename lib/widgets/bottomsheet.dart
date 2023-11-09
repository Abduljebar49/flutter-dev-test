import 'package:dev_test/funtions/constant.dart';
import 'package:dev_test/widgets/comments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsBottomSheet extends StatefulWidget {
  const CommentsBottomSheet({super.key});

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              color: Colors.black54,
            ),
            child: const Text(
              '45k Comments',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return CommentWidget(comment: comments[index]);
              },
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.25,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/image4.png', // Replace with the path to your asset
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover, // Adjust the fit property as needed
                  ),
                ),
              ),
              Container(
                width: Get.width * .75,
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '😃',
                        style: TextStyle(fontSize: 25),
                      ),
                    ), //
                    suffixIcon: const Icon(
                      Icons.send,
                      color: Colors.blue,
                      size: 30,
                    ), // Icon at the end
                    hintText: 'Add comment',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

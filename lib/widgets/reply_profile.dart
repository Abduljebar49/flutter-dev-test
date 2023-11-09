import 'package:dev_test/models/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReplayCommentWidget extends StatelessWidget {
  final Comment comment;

  const ReplayCommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.png', // Replace with the path to your asset
                    width: 44,
                    height: 44,
                    fit: BoxFit.cover, // Adjust the fit property as needed
                  ),
                ),
              ),
              Container(
                width: 1.0, // Adjust the width of the line
                height: 110.0, // Adjust the height of the line
                color: Colors.black, // Line color
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Kerry Johns',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '@Kerryjo',
                    style: TextStyle(
                      color: Color(0xFF5C8DFF),
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: 54,
                  ),
                  Text(
                    '3 hours ago',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                width: Get.width * .7,
                child: const Text(
                  'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper 😃 amet justo quisque 😃😃 ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
                  // style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: [
                    const Text(
                      'Replying to',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'John Doe @JohntheD',
                      style: TextStyle(
                        color: Colors.orange.shade200,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

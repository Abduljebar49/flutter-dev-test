import 'package:dev_test/models/comments_model.dart';
import 'package:dev_test/pages/reply.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ClipOval(
              child: Image.asset(
                comment.avatarUrl, // Replace with the path to your asset
                width: 44,
                height: 44,
                fit: BoxFit.cover, // Adjust the fit property as needed
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    comment.name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    comment.username,
                    style: const TextStyle(
                      color: Color(0xFF5C8DFF),
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    width: 54,
                  ),
                  Text(
                    '${comment.hours} hours ago',
                    style: const TextStyle(
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
                child: Text(
                  comment.comment,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 6,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ReplyPage());
                      },
                      child: SvgPicture.asset(
                        'assets/icons/message.svg',
                        width: 28,
                        height: 28,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      comment.commentCount > 0
                          ? comment.commentCount.toString()
                          : '',
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SvgPicture.asset(
                      'assets/icons/like.svg',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '7k',
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SvgPicture.asset(
                      'assets/icons/flag.svg',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              comment.replies > 0
                  ? Container(
                      color: Colors.grey.shade100,
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        children: [
                          Text('View 15 replies '),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}

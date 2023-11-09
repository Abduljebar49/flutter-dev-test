import 'package:dev_test/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black, // Border color
            width: 0.25, // Border width
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 27,
          top: 40,
          right: 10,
          bottom: 10,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MenuItem(
              text: 'Post a Seequl',
              url: 'assets/icons/post.svg',
            ),
            MenuItem(
              text: 'View likes',
              url: 'assets/icons/view_like.svg',
            ),
            MenuItem(
              text: 'Your seequl post',
              url: 'assets/icons/your_posts.svg',
            ),
            MenuItem(
              text: 'Reference Contribution',
              url: 'assets/icons/reference.svg',
            ),
            MenuItem(
              text: 'Hashtag challenge',
              url: 'assets/icons/hashtag.svg',
            ),
            MenuItem(
              text: 'Notification',
              url: 'assets/icons/notification.svg',
            ),
            MenuItem(
              text: 'About',
              url: 'assets/icons/about.svg',
            ),
          ],
        ),
      ),
    );
  }
}

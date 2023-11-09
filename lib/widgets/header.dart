import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 28,
        bottom: 5,
      ),
      padding: const EdgeInsets.only(left: 25, right: 42),
      width: Get.width,
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
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: const Text('SeeQul')),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 32, right: 42),
                child: SvgPicture.asset(
                  'assets/icons/top_search.svg',
                  width: 18,
                  height: 18,
                ),
              ),
              SvgPicture.asset(
                'assets/icons/top_group.svg',
                width: 18,
                height: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

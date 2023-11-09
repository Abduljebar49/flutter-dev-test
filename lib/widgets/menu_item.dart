import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final String url;
  const MenuItem({
    super.key,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 23),
      child: Row(
        children: [
          SvgPicture.asset(
            url,
            width: 27,
            height: 24,
          ),
          const SizedBox(
            width: 13,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}

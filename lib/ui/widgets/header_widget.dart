import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class RowHeaderWidget extends StatelessWidget {
  const RowHeaderWidget(
      {super.key,
      required this.title,
      required this.iconUrl,
      required this.onTap});

  final String title;
  final String iconUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (iconUrl != '')
          GestureDetector(
            onTap: onTap,
            child: Image.asset(
              iconUrl,
              color: whiteColor,
              width: 24,
              height: 24,
            ),
          ),
        if (iconUrl != '') const SizedBox(width: 35),
        Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 22,
            fontWeight: bold,
          ),
        ),
        const Spacer(),
        Image.asset(
          'assets/icon_search.png',
          color: whiteColor,
          width: 24,
          height: 24,
        ),
      ],
    );
  }
}

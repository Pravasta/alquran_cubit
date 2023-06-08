import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.imageUrl,
    required this.doaDoa,
    required this.title,
    required this.iconUrl,
    required this.intro,
  });

  final String imageUrl;
  final String doaDoa;
  final String title;
  final String iconUrl;
  final String intro;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 161,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0, .6, 1],
              colors: [
                gradient3,
                gradient2,
                gradient1,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: iconUrl.isNotEmpty ? -6 : -15,
          right: iconUrl.isNotEmpty ? 0 : 10,
          child: Image.asset(
            imageUrl,
            width: 210,
            height: iconUrl.isNotEmpty ? 130 : 180,
            fit: iconUrl.isNotEmpty ? BoxFit.contain : BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (iconUrl.isNotEmpty)
                    Image.asset(
                      iconUrl,
                    ),
                  if (iconUrl.isNotEmpty) const SizedBox(width: 10),
                  Text(
                    intro,
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: whiteTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                doaDoa,
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

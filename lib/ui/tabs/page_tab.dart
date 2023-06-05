import 'package:alquran_new/shared/theme.dart';
import 'package:flutter/material.dart';

class PageTab extends StatelessWidget {
  const PageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          'PageTab',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}

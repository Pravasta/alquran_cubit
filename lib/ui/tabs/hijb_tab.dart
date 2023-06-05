import 'package:alquran_new/shared/theme.dart';
import 'package:flutter/material.dart';

class HijbTab extends StatelessWidget {
  const HijbTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          'HijbTab',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}

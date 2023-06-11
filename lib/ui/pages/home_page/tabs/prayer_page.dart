import 'package:alquran_new/shared/theme.dart';
import 'package:flutter/material.dart';

class PrayerPage extends StatelessWidget {
  const PrayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          'PrayerPage',
          style: whiteTextStyle.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}

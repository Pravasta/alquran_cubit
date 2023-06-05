import 'package:alquran_new/shared/theme.dart';
import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          'TipsPage',
          style: whiteTextStyle.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}

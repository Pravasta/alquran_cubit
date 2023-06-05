import 'package:alquran_new/shared/theme.dart';
import 'package:flutter/material.dart';

class DoaPage extends StatelessWidget {
  const DoaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          'DoaPage',
          style: whiteTextStyle.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}

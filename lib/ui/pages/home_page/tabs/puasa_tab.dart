import 'package:alquran_new/shared/theme.dart';
import 'package:flutter/material.dart';

class PuasaTab extends StatelessWidget {
  const PuasaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          'This Tab is Coming soon!!',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}

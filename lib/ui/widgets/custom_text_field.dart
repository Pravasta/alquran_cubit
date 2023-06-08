import 'package:alquran_new/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
  });

  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1,
          color: lightPurpleColor,
        ),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 18, horizontal: defaultMargin),
            hintText: 'Search doa ...',
            suffixIcon: Image.asset('assets/icon_search.png'),
            hintStyle: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: whiteColor,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

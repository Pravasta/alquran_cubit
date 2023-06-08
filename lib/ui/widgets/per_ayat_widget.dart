import 'package:alquran_new/shared/theme.dart';
import 'package:flutter/material.dart';

class PerAyatWidget extends StatelessWidget {
  const PerAyatWidget({
    super.key,
    required this.numberAyat,
    required this.ayatSurah,
    required this.terjemahanSurah,
    required this.latinSurah,
  });

  final String numberAyat;
  final String ayatSurah;
  final String latinSurah;
  final String terjemahanSurah;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
            width: double.infinity,
            decoration: BoxDecoration(
              color: bottomNavbarColor,
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  bottomNavbarColor,
                  purpleColor,
                ],
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/no_ayat.png',
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      numberAyat,
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/icon_share.png',
                  width: 26,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/icon_play.png',
                  width: 26,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/icon_save.png',
                  width: 26,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              ayatSurah,
              textAlign: TextAlign.right,
              style: lightTextStyle.copyWith(
                  color: whiteColor,
                  fontSize: 20,
                  fontWeight: semiBold,
                  height: 3),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              latinSurah,
              textAlign: TextAlign.right,
              style: lightTextStyle.copyWith(
                color: whiteColor,
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            terjemahanSurah,
            style: greyTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 16),
          Divider(
            thickness: 0.2,
            color: greyColor,
          ),
        ],
      ),
    );
  }
}

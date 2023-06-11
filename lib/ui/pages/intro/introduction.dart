import 'package:alquran_new/shared/theme.dart';
import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quran App',
              style: whiteTextStyle.copyWith(
                fontSize: 30,
                fontWeight: extraBold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Learn Quran and\nRecite once everyday',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                fontSize: 18,
                fontWeight: reguler,
              ),
            ),
            const SizedBox(height: 50),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 550,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: lightPurpleColor,
                    image: const DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.contain,
                      image: AssetImage(
                        'assets/svg.png',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      // Biar semua bisa di klik
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/main-page',
                        (route) => false,
                      ),
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          color: orangeColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: purpleTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

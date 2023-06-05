import 'package:alquran_new/shared/theme.dart';
import 'package:alquran_new/ui/tabs/hijb_tab.dart';
import 'package:alquran_new/ui/tabs/page_tab.dart';
import 'package:alquran_new/ui/tabs/juz_tab.dart';
import 'package:alquran_new/ui/tabs/surah_tab.dart';
import 'package:alquran_new/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderWidget(
                        onTap: () {},
                        title: 'Quran App',
                        iconUrl: 'assets/icon_menu.png',
                      ),
                      intro(),
                      banerHome(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  backgroundColor: primaryColor,
                  automaticallyImplyLeading: false,
                  shape: Border(
                    bottom: BorderSide(
                      width: 3,
                      color: greyColor.withOpacity(.1),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
                    child: tabBar(),
                  ),
                ),
              ],
              body: const TabBarView(
                children: [
                  SurahTab(),
                  JuzTab(),
                  PageTab(),
                  HijbTab(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TabBar tabBar() {
    return TabBar(
      unselectedLabelColor: greyColor,
      labelColor: whiteColor,
      indicatorWeight: 3,
      tabs: [
        tabItem('Surah'),
        tabItem('Juz'),
        tabItem('Page'),
        tabItem('Hijb'),
      ],
    );
  }

  Tab tabItem(String item) {
    return Tab(
      child: Text(
        item,
        style: TextStyle(
          fontSize: 18,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget intro() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assalamualaikum',
            style: greyTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          const SizedBox(height: 6),
          Text(
            'Pravasta Rama F',
            style: whiteTextStyle.copyWith(fontSize: 26, fontWeight: semiBold),
          )
        ],
      ),
    );
  }

  Widget banerHome() {
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
                gradient1,
                gradient2,
                gradient3,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -6,
          right: 0,
          child: Image.asset(
            'assets/icon_quran.png',
            width: 210,
            height: 130,
            fit: BoxFit.contain,
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
                  Image.asset(
                    'assets/last_read.png',
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Last Read',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Al-Fatihah',
                style: whiteTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Ayah No: 1',
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

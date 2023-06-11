import 'package:alquran_new/shared/theme.dart';
import 'package:alquran_new/ui/pages/home_page/tabs/prayer_page.dart';
import 'package:alquran_new/ui/pages/home_page/tabs/puasa_tab.dart';
import 'package:alquran_new/ui/pages/home_page/tabs/juz_tab.dart';
import 'package:alquran_new/ui/pages/home_page/tabs/surah_tab.dart';
import 'package:alquran_new/ui/widgets/banner_widget.dart';
import 'package:alquran_new/ui/widgets/custom_text_field.dart';
import 'package:alquran_new/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: _header(),
        body: DefaultTabController(
          length: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _searchWidget(),
                      _intro(),
                      _banerHome(),
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
                  PrayerPage(),
                  PuasaTab(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _header() {
    return AppBar(
      backgroundColor: primaryColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: RowHeaderWidget(
        title: 'Quran App',
        iconUrl: '',
        onTap: () {},
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
        tabItem('Sholat'),
        tabItem('Puasa'),
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

  Widget _intro() {
    return Container(
      margin: EdgeInsets.only(bottom: defaultMargin, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assalamualaikum',
            style: greyTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          const SizedBox(height: 6),
          Text(
            'Sudahkah kamu membaca ku hari ini ? ',
            style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.location_pin, color: orangeColor),
              const SizedBox(width: 10),
              Text(
                'Lokasi is Coming soon',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                  color: orangeColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _banerHome() {
    return const BannerWidget(
      imageUrl: 'assets/icon_quran.png',
      iconUrl: 'assets/last_read.png',
      title: 'Al-Fatihah',
      doaDoa: 'Ayah No: 2',
      intro: 'Last Read',
    );
  }

  Widget _searchWidget() {
    return const CustomTextField(
      hintText: 'Search ayat ...',
    );
  }
}

import 'package:alquran_new/shared/theme.dart';
import 'package:alquran_new/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Column(
            children: [
              _header(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return HeaderWidget(
      title: 'Bookmarks',
      iconUrl: 'assets/icon_menu.png',
      onTap: () {},
    );
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin + 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/add_collection.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Add new collection',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              const Spacer(),
              Container(
                width: 26,
                height: 26,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/sort_collection.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 35),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Coba $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:alquran_new/shared/theme.dart';
import 'package:alquran_new/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(),
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
              _body(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _header() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      elevation: 0,
      title: RowHeaderWidget(
        title: 'Bookmark',
        iconUrl: '',
        onTap: () {},
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Container(
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Coba ${index + 1}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

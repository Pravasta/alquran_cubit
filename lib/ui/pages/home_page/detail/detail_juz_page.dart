import 'package:alquran_new/models/juz/juz_model.dart' as j;
import 'package:alquran_new/shared/theme.dart';
import 'package:alquran_new/ui/widgets/header_widget.dart';
import 'package:alquran_new/ui/widgets/per_ayat_widget.dart';
import 'package:flutter/material.dart';

class DetailJuzPage extends StatefulWidget {
  const DetailJuzPage({
    super.key,
    required this.juz,
  });

  final j.Juz juz;

  @override
  State<DetailJuzPage> createState() => _DetailJuzPageState();
}

class _DetailJuzPageState extends State<DetailJuzPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: primaryColor,
              automaticallyImplyLeading: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: _header(context),
              ),
            ),
          ];
        },
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: _bodySurah(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _header(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      elevation: 0,
      title: RowHeaderWidget(
        title: 'Juz ${widget.juz.juz}',
        iconUrl: 'assets/icon_arrow_back.png',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _cardJudul() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          opacity: 0.2,
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/icon_quran.png',
          ),
        ),
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mulai dari ${widget.juz.juzStartInfo}',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: extraBold,
              ),
            ),
            const SizedBox(height: 4),
            Divider(
              thickness: 0.5,
              color: whiteColor,
              indent: 100,
              endIndent: 100,
            ),
            const SizedBox(height: 4),
            Text(
              'Sampai ${widget.juz.juzEndInfo}',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: extraBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodySurah() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.juz.verses!.length,
      itemBuilder: (context, index) {
        j.Verse detailJuz = widget.juz.verses![index];

        return Column(
          children: [
            if (detailJuz.number.inSurah == 1) _cardJudul(),
            SizedBox(height: defaultMargin),
            PerAyatWidget(
              numberAyat: '${detailJuz.number.inSurah}',
              ayatSurah: detailJuz.text.arab,
              terjemahanSurah: detailJuz.translation.id.toString(),
              latinSurah: detailJuz.text.transliteration.en,
            ),
          ],
        );
      },
    );
  }
}

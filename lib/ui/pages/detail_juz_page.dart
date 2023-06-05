import 'package:alquran_new/cubit/detail_surah/get_detail_surah_cubit.dart';
import 'package:alquran_new/cubit/juz/juz_cubit.dart';
import 'package:alquran_new/models/detail_surah_model.dart' as s;
import 'package:alquran_new/models/juz_model.dart' as j;
import 'package:alquran_new/shared/theme.dart';
import 'package:alquran_new/ui/widgets/header_widget.dart';
import 'package:alquran_new/ui/widgets/per_ayat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void initState() {
    context.read<JuzCubit>().getJuzQuran();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final surah = context.watch<s.DetailSurah>();
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  backgroundColor: primaryColor,
                  automaticallyImplyLeading: false,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(-3),
                    child: _header(surah),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _cardJudul(surah),
                    ],
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                _bodySurah(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(s.DetailSurah surah) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: HeaderWidget(
        title: surah.name!.transliteration!.id!,
        iconUrl: 'assets/icon_arrow_back.png',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _cardJudul(s.DetailSurah surah) {
    return Padding(
      padding: EdgeInsets.only(
        top: defaultMargin + 10,
      ),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => showDialogTafsir(surah),
          );
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 350,
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
              bottom: 6,
              right: 0,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/icon_quran.png',
                  width: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 67),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      surah.name!.transliteration!.id!,
                      style: whiteTextStyle.copyWith(
                        fontSize: 30,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      surah.name!.translation!.id!,
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Divider(thickness: 0.5, color: whiteColor),
                    const SizedBox(height: 20),
                    Text(
                      '${surah.revelation!.id} | ${surah.numberOfVerses} Ayat',
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      surah.name!.long!,
                      style: lightTextStyle.copyWith(
                          fontSize: 45, fontWeight: bold, color: whiteColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodySurah() {
    return Expanded(
      child: BlocBuilder<GetDetailSurahCubit, GetDetailSurahState>(
        builder: (context, state) {
          if (state is GetDetailSurahLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (state is GetDetailSurahSucces) {
              return ListView.builder(
                itemCount: state.detailSurah.verses!.length,
                itemBuilder: (context, index) {
                  final detailSurah = state.detailSurah.verses![index];
                  return PerAyatWidget(
                    numberAyat: '${detailSurah.number!.inSurah}',
                    ayatSurah: detailSurah.text!.arab!,
                    terjemahanSurah: detailSurah.translation!.id.toString(),
                    latinSurah: '${detailSurah.text!.transliteration!.en}',
                  );
                },
              );
            }
            if (state is GetDetailSurahFailed) {
              return Center(
                child: Text(
                  state.error,
                  style: whiteTextStyle,
                ),
              );
            }

            return const Center(
              child: Text('No Data'),
            );
          }
        },
      ),
    );
  }

  Widget showDialogTafsir(s.DetailSurah surah) {
    return Dialog(
      backgroundColor: greyColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Tafsir ${surah.name!.transliteration!.id}',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  surah.tafsir!.id!,
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

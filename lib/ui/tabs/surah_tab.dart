import 'package:alquran_new/cubit/surah_cubit/get_api_quran_cubit.dart';
import 'package:alquran_new/shared/theme.dart';
import 'package:alquran_new/ui/pages/detail_surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/surah/surah_model.dart';

class SurahTab extends StatefulWidget {
  const SurahTab({super.key});

  @override
  State<SurahTab> createState() => _SurahTabState();
}

class _SurahTabState extends State<SurahTab> {
  @override
  void initState() {
    context.read<GetApiQuranCubit>().getAllSurah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetApiQuranCubit, GetApiQuranState>(
      builder: (context, state) {
        if (state is GetApiQuranLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state is GetApiQuranSucces) {
            return ListView.builder(
              itemCount: state.surah.length,
              itemBuilder: (context, index) {
                Surah surah = state.surah[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailSurahPage(surah: surah),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: defaultMargin, bottom: 16),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
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
                                  '${surah.number}',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16, fontWeight: medium),
                                ),
                              ),
                            ),
                            const SizedBox(width: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  surah.name!.transliteration!.id!,
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${surah.revelation!.id} | ${surah.numberOfVerses} Ayat',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Text(
                              surah.name!.short!,
                              style: lightTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: greyColor.withOpacity(.4),
                    ),
                  ],
                );
              },
            );
          }
          if (state is GetApiQuranFailed) {
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
    );
  }
}

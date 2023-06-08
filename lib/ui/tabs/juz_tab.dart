import 'package:alquran_new/cubit/juz_cubit/juz_cubit.dart';
import 'package:alquran_new/models/juz/juz_model.dart' as j;
import 'package:alquran_new/shared/theme.dart';
import 'package:alquran_new/ui/pages/detail_juz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JuzTab extends StatefulWidget {
  const JuzTab({super.key});

  @override
  State<JuzTab> createState() => _JuzTabState();
}

class _JuzTabState extends State<JuzTab> {
  @override
  void initState() {
    context.read<JuzCubit>().getJuzQuran();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JuzCubit, JuzState>(
      builder: (context, state) {
        if (state is JuzLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state is JuzzSuccess) {
            return ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                j.Juz juz = state.juz[index];

                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailJuzPage(juz: juz);
                            },
                          ),
                        );
                      },
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
                                  '${index + 1}',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Juz ${index + 1}',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Mulai dari ${juz.juzStartInfo}',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                                Text(
                                  'Sampai ${juz.juzEndInfo}',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }

          if (state is JuzFailed) {
            return Center(
              child: Text(
                state.message,
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

import 'package:alquran_new/cubit/show_doa/show_doa_cubit.dart';
import 'package:alquran_new/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoaWidget extends StatelessWidget {
  const DoaWidget(
      {super.key,
      required this.judul,
      required this.arab,
      required this.latin,
      required this.arti,
      required this.id});

  final String judul;
  final String arab;
  final String latin;
  final String arti;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowDoaCubit, Map<String, bool>>(
      builder: (context, showWidget) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          margin: EdgeInsets.only(bottom: defaultMargin),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                bottomNavbarColor,
                purpleColor,
              ],
            ),
            color: bottomNavbarColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
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
                        id,
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      judul,
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: reguler,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final cubitShow = context.read<ShowDoaCubit>();

                      if (showWidget.containsKey(id) && showWidget[id]!) {
                        cubitShow.closePopUp(id);
                      } else {
                        cubitShow.showPopUp(id);
                      }
                    },
                    icon: Icon(
                      showWidget.containsKey(id) && showWidget[id]!
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
              showWidget.containsKey(id) && showWidget[id]!
                  ? Row(
                      children: [
                        const SizedBox(
                          width: 45,
                          height: 45,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  arab,
                                  textAlign: TextAlign.right,
                                  style: lightTextStyle.copyWith(
                                      fontSize: 22, height: 3),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  latin,
                                  textAlign: TextAlign.right,
                                  style: whiteTextStyle,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Artinya : $arti',
                                style: greyTextStyle.copyWith(),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        const SizedBox(height: 45, width: 45),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}

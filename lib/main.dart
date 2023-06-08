import 'package:alquran_new/cubit/detail_juz_cubit/detail_juz_cubit.dart';
import 'package:alquran_new/cubit/detail_surah_cubit/get_detail_surah_cubit.dart';
import 'package:alquran_new/cubit/doa_cubit/doa_cubit_cubit.dart';
import 'package:alquran_new/cubit/juz_cubit/juz_cubit.dart';
import 'package:alquran_new/cubit/show_doa/show_doa_cubit.dart';
import 'package:alquran_new/ui/bottom_nav/home_page.dart';
import 'package:alquran_new/ui/pages/main_page.dart';
import 'package:alquran_new/ui/pages/introduction.dart';
import 'package:alquran_new/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/surah_cubit/get_api_quran_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetApiQuranCubit()),
        BlocProvider(create: (context) => GetDetailSurahCubit()),
        BlocProvider(create: (context) => JuzCubit()),
        BlocProvider(create: (context) => DetailJuzCubit()),
        BlocProvider(create: (context) => DoaCubitCubit()),
        BlocProvider(create: (context) => ShowDoaCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/intro': (context) => const IntroductionPage(),
          '/main-page': (context) => const MainPage(),
          '/home-page': (context) => const HomePage(),
        },
      ),
    );
  }
}

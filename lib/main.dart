import 'package:alquran_new/cubit/detail_surah/get_detail_surah_cubit.dart';
import 'package:alquran_new/cubit/juz/juz_cubit.dart';
import 'package:alquran_new/ui/pages/home_page.dart';
import 'package:alquran_new/ui/pages/main_page.dart';
import 'package:alquran_new/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/surah/get_api_quran_cubit.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/main-page': (context) => const MainPage(),
          '/home-page': (context) => const HomePage(),
        },
      ),
    );
  }
}

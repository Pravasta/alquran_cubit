import 'package:alquran_new/cubit/niat_dan_doa_solat/doa_solat_cubit.dart';
import 'package:alquran_new/cubit/niat_dan_doa_solat/niat_solat_cubit.dart';
import 'package:alquran_new/models/niat_dan_doa_solat/doa_solat_model.dart';
import 'package:alquran_new/models/niat_dan_doa_solat/niat_solat_model.dart';
import 'package:alquran_new/shared/theme.dart';
import 'package:alquran_new/ui/widgets/banner_widget.dart';
import 'package:alquran_new/ui/widgets/doa_widget.dart';
import 'package:alquran_new/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoaSolatPage extends StatefulWidget {
  const DoaSolatPage({super.key});

  @override
  State<DoaSolatPage> createState() => _DoaSolatPageState();
}

class _DoaSolatPageState extends State<DoaSolatPage> {
  @override
  void initState() {
    context.read<DoaSolatCubit>().getListDoaSolat();
    context.read<NiatSolatCubit>().getNiatSolat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
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
                  child: Column(
                    children: [
                      _header(),
                    ],
                  ),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: EdgeInsets.only(
              //       left: defaultMargin,
              //       right: defaultMargin,
              //     ),
              //     child: Column(
              //       children: [
              //         _bannerDoaSolat(),
              //       ],
              //     ),
              //   ),
              // ),
            ];
          },
          body: ListView(
            padding: EdgeInsets.only(
                left: defaultMargin, right: defaultMargin, top: defaultMargin),
            children: [
              _bannerNiatSolat(),
              _bodyNiatSolat(),
              _bannerDoaSolat(),
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
        title: 'Niat dan Doa Solat',
        iconUrl: '',
        onTap: () {},
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<DoaSolatCubit, DoaSolatState>(
      builder: (context, state) {
        if (state is DoaSolatLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state is DoaSolatSucces) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: defaultMargin),
              itemCount: state.doaSolat.length,
              itemBuilder: (context, index) {
                DoaSolat doaSolat = state.doaSolat[index];
                return _doaWidget(doaSolat);
              },
            );
          }
          if (state is DoaSolatFailed) {
            return Center(
              child: Text(
                state.error,
                style: whiteTextStyle,
              ),
            );
          }
          return Center(
            child: Text(
              'Tidak ada Data',
              style: whiteTextStyle,
            ),
          );
        }
      },
    );
  }

  Widget _bodyNiatSolat() {
    return BlocBuilder<NiatSolatCubit, NiatSolatState>(
      builder: (context, state) {
        if (state is NiatSolatLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state is NiatSolatSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: defaultMargin),
              itemCount: state.niatSolat.length,
              itemBuilder: (context, index) {
                NiatSolat niatSolat = state.niatSolat[index];
                return _doaWidgetNiatSolat(niatSolat);
              },
            );
          }
          if (state is NiatSolatFailed) {
            return Center(
              child: Text(
                state.error,
                style: whiteTextStyle,
              ),
            );
          }
          return Center(
            child: Text(
              'Tidak ada Data',
              style: whiteTextStyle,
            ),
          );
        }
      },
    );
  }

  Widget _bannerDoaSolat() {
    return const BannerWidget(
      imageUrl: 'assets/doa.png',
      doaDoa: 'Seorang Dosa',
      title: 'Solat lah meskipun',
      iconUrl: '',
      intro: 'Doa Solat',
    );
  }

  Widget _bannerNiatSolat() {
    return const BannerWidget(
      imageUrl: 'assets/doa.png',
      doaDoa: 'Tutup dengan doa',
      title: 'Mulai lah dengan niat',
      iconUrl: '',
      intro: 'Niat Solat',
    );
  }

  Widget _doaWidget(DoaSolat doaSolat) {
    return DoaWidget(
      judul: '${doaSolat.name}',
      arab: '${doaSolat.arabic}',
      latin: doaSolat.latin!.toLowerCase(),
      arti: '${doaSolat.terjemahan}',
      id: '${doaSolat.id}',
    );
  }

  Widget _doaWidgetNiatSolat(NiatSolat niatSolat) {
    return DoaWidget(
      judul: '${niatSolat.name}',
      arab: '${niatSolat.arabic}',
      latin: niatSolat.latin!.toLowerCase(),
      arti: '${niatSolat.terjemahan}',
      id: '${niatSolat.id}',
    );
  }
}

import 'package:alquran_new/cubit/doa_cubit/doa_cubit_cubit.dart';
import 'package:alquran_new/models/doa/doa_model.dart';
import 'package:alquran_new/shared/theme.dart';
import 'package:alquran_new/ui/widgets/banner_widget.dart';
import 'package:alquran_new/ui/widgets/custom_text_field.dart';
import 'package:alquran_new/ui/widgets/doa_widget.dart';
import 'package:alquran_new/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoaPage extends StatefulWidget {
  const DoaPage({super.key});

  @override
  State<DoaPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  @override
  void initState() {
    context.read<DoaCubitCubit>().getListDoa();
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: Column(
                    children: [
                      _searchWidget(),
                      _banner(),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.only(
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
      ),
    );
  }

  AppBar _header() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      elevation: 0,
      title: RowHeaderWidget(
        title: 'Kumpulan Doa - Doa',
        iconUrl: '',
        onTap: () {},
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: BlocBuilder<DoaCubitCubit, DoaCubitState>(
        builder: (context, state) {
          if (state is DoaCubitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (state is DoaCubitSuccess) {
              return ListView.builder(
                padding: EdgeInsets.only(top: defaultMargin),
                itemCount: state.doaModel.length,
                itemBuilder: (context, index) {
                  DoaModel doaModel = state.doaModel[index];
                  return _doaWidget(doaModel);
                },
              );
            }
            if (state is DoaCubitFailed) {
              return Center(
                child: Text(
                  state.message,
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
      ),
    );
  }

  Widget _banner() {
    return Padding(
      padding: EdgeInsets.only(top: defaultMargin),
      child: const BannerWidget(
        imageUrl: 'assets/doa.png',
        doaDoa: 'Tutup dengan Aammin',
        title: 'Mulai dengan Basmallah',
        iconUrl: '',
        intro: 'Kumpulan doa',
      ),
    );
  }

  Widget _doaWidget(DoaModel doaModel) {
    return DoaWidget(
      judul: '${doaModel.doa}',
      arab: '${doaModel.ayat}',
      latin: doaModel.latin!.toLowerCase(),
      arti: '${doaModel.artinya}',
      id: '${doaModel.id}',
    );
  }

  Widget _searchWidget() {
    return const CustomTextField(
      hintText: 'Search doa ...',
    );
  }
}

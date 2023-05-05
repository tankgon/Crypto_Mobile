// ignore_for_file: public_member_api_docs, sort_constructors_first, must_call_super
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_flutter/src/models/assets.dart';
import 'package:movie_flutter/src/models/assets_response.dart';

import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

import '../../models/login_response.dart';
import '../../styles/widgets/gradien_text_widget.dart';
import '../../styles/widgets/loading_widget.dart';
import 'Components/item_wallet.dart';
import 'bloc/wallet_bloc.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({
    Key? key,
    this.dataProfile,
  }) : super(key: key);
  final LoginResData? dataProfile;
  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final WalletBloc _walletBloc = WalletBloc();

  @override
  void initState() {
    _walletBloc.add(GetWalletList());
    super.initState();
    // assestBloc.getAssetsUser();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: BlocProvider(
            create: (_) => _walletBloc,
            child: BlocListener<WalletBloc, WalletState>(
                listener: (context, state) {
              if (state is WalletError) {
                ErrorWidget(state.message);
              }
            }, child: BlocBuilder<WalletBloc, WalletState>(
              builder: (context, state) {
                if (state is WalletInitial) {
                  return const LoadingWidget();
                } else if (state is WalletLoading) {
                  return const LoadingWidget();
                } else if (state is WalletLoaded) {
                  return SafeArea(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: size.height / 25,
                                  backgroundImage: const NetworkImage(
                                      "https://source.unsplash.com/random/200x200?sig=incrementingIdentifier"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GradientText(
                                          widget.dataProfile?.name ?? '',
                                          style: AppTextStyles.h2,
                                          gradient: AppColors.gradienIcon),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          widget.dataProfile?.phoneNumber ?? '',
                                          style: AppTextStyles.h1C,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          for (var e in state.wallet.listAssest)
                            if (e.symbol == 'VND')
                              ItemInformation(
                                  size: size,
                                  label: 'Sd khả dụng',
                                  money: '${e.freeAsset}'),
                          for (var e in state.wallet.listAssest)
                            if (e.symbol == 'VND')
                              ItemInformation(
                                size: size,
                                label: 'Sd giao dịch',
                                money: '${e.lockedAsset}',
                              ),
                          Column(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24, top: 12),
                                  child: SizedBox(
                                      height: size.height / 2,
                                      child:
                                          _buildListStock(size, state.wallet)))
                            ],
                          )
                        ]),
                  );
                } else if (state is WalletError) {
                  return ErrorWidget(state.message);
                } else {
                  return Container();
                }
              },
            ))));
  }
}

Widget _buildListStock(Size size, AssetsResponse data) {
  final List<Assest> stockInit = data.listAssest;
  return Table(
    textDirection: TextDirection.rtl,
    defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
    border: TableBorder.all(
        borderRadius: BorderRadius.circular(10),
        width: 1.0,
        color: AppColors.white54),
    children: [
      const TableRow(
          decoration: BoxDecoration(
            color: Color.fromARGB(16, 33, 149, 243),
          ),
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Cổ phiếu khóa", textScaleFactor: 1.2),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Cổ phiếu hợp lệ", textScaleFactor: 1.2),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Cổ phiếu", textScaleFactor: 1.2),
            ),
          ]),
      for (var e in stockInit)
        if (e.symbol != 'VND')
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                e.lockedAsset ?? '',
                style: const TextStyle(color: AppColors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                e.freeAsset ?? '',
                style: const TextStyle(color: AppColors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                e.symbol ?? '',
                style: AppTextStyles.h1W,
              ),
            ),
          ]),
    ],
  );
}

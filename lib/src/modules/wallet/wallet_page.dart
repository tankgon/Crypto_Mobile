import 'package:flutter/material.dart';
import 'package:movie_flutter/src/models/assets.dart';
import 'package:movie_flutter/src/models/assets_response.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

import '../../styles/widgets/gradien_text.dart';
import 'Components/item_wallet.dart';
import 'get_assets_bloc.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    super.initState();
    assestBloc.getAssetsUser();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: StreamBuilder<AssetsResponse>(
      stream: assestBloc.subject.stream,
      builder: (context, AsyncSnapshot<AssetsResponse> snapshot) {
        snapshot.data?.listAssest.map((e) {
          return e.name;
        });
        if (snapshot.hasData) {
          if (snapshot.data!.error.isNotEmpty) {
            return _buildErrorWidget(snapshot.data!.error);
          }
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              GradientText('Thanh ne',
                                  style: AppTextStyles.h3,
                                  gradient: AppColors.gradienIcon),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  '0338091539',
                                  style: AppTextStyles.h1C,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  for (var e in snapshot.data!.listAssest)
                    if (e.symbol == 'VND')
                      ItemInformation(
                          size: size,
                          label: 'Sd khả dụng',
                          money: '${e.freeAsset}'

                          // '${snapshot.data!.listAssest.map(
                          //   (e) {
                          //     if (e.symbol != 'VND') {
                          //       return e.freeAsset;
                          //     }
                          //   },
                          // )}',
                          ),
                  for (var e in snapshot.data!.listAssest)
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
                              height: size.width,
                              child:

                                  // StreamBuilder<AssetsResponse>(
                                  //   stream: assestBloc.subject.stream,
                                  //   builder: (context,
                                  //       AsyncSnapshot<AssetsResponse> snapshot) {
                                  //     snapshot.data?.listAssest.map((e) {
                                  //       return e.name;
                                  //     });
                                  //     if (snapshot.hasData) {
                                  //       if (snapshot.data!.error.isNotEmpty) {
                                  //         return _buildErrorWidget(
                                  //             snapshot.data!.error);
                                  //       }
                                  //       return

                                  _buildListStock(size, snapshot.data!)

                              //     } else if (snapshot.hasError) {
                              //       return _buildErrorWidget(
                              //           snapshot.error.toString());
                              //     } else {
                              //       return _buildLoadingWidget();
                              //     }
                              //   },
                              // ),

                              ))
                    ],
                  )
                ]),
          );
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error.toString());
        } else {
          return _buildLoadingWidget();
        }
      },
    ));
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

Widget _buildErrorWidget(String error) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Error occured: $error"),
    ],
  ));
}

Widget _buildLoadingWidget() {
  return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          )
        ],
      ));
}



// import 'package:flutter/material.dart';
// import 'package:movie_flutter/src/models/assets.dart';
// import 'package:movie_flutter/src/models/assets_response.dart';
// import 'package:movie_flutter/src/styles/themes/app_colors.dart';
// import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

// import '../../styles/widgets/gradien_text.dart';
// import 'get_assets_bloc.dart';

// class WalletPage extends StatefulWidget {
//   const WalletPage({Key? key});

//   @override
//   State<WalletPage> createState() => _WalletPageState();
// }

// class _WalletPageState extends State<WalletPage> {
//   @override
//   void initState() {
//     super.initState();
//     assestBloc.getAssetsUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: SafeArea(
//             child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
//           child: Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CircleAvatar(
//                 radius: size.height / 25,
//                 backgroundImage: const NetworkImage(
//                     "https://source.unsplash.com/random/200x200?sig=incrementingIdentifier"),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     GradientText('Thanh ne',
//                         style: AppTextStyles.h3,
//                         gradient: AppColors.gradienIcon),
//                     Padding(
//                       padding: EdgeInsets.only(top: 16),
//                       child: Text(
//                         '0338091539',
//                         style: AppTextStyles.h1C,
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         // ItemInformation(
//         //   size: size,
//         //   label: 'Số dư khả dụng',
//         //   money: '18005726',
//         // ),
//         // ItemInformation(
//         //   size: size,
//         //   label: 'Số dư giao dịch',
//         //   money: '3393',
//         // ),
//         // Container(
//         //   margin: const EdgeInsets.only(left: 24, right: 24),
//         //   decoration: const BoxDecoration(
//         //     color: Color.fromARGB(16, 33, 149, 243),

//         //   ),
//         //   child: Row(
//         //     children: const [
//         //       Padding(
//         //         padding: EdgeInsets.all(16.0),
//         //         child: Text("Cổ phiếu khóa", textScaleFactor: 1.2),
//         //       ),
//         //       Padding(
//         //         padding: EdgeInsets.all(16.0),
//         //         child: Text("Cổ phiếu hợp lệ", textScaleFactor: 1.2),
//         //       ),
//         //       Padding(
//         //         padding: EdgeInsets.all(16.0),
//         //         child: Text("Cổ phiếu", textScaleFactor: 1.2),
//         //       ),
//         //     ],
//         //   ),
//         // ),

//         Container(
//           margin: const EdgeInsets.only(left: 24, right: 24),
//           height: size.height / 10,
//           decoration: BoxDecoration(
//               color: const Color.fromARGB(16, 33, 149, 243),
//               // borderRadius: const BorderRadius.only(topLeft:),
//               border: Border.all(color: AppColors.white54)),
//           child: Row(
//             children: [
//               const Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 16.0),
//                   child: Text(
//                     'Cổ phiếu',
//                     style: AppTextStyles.h2C,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 1,
//                 height: 40,
//                 color: AppColors.white54,
//                 margin: const EdgeInsets.only(left: 16, right: 16),
//               ),
//               Expanded(
//                 child: Container(
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.only(right: 16.0),
//                     child: const Text(
//                       'Giá \nhợp lệ',
//                       style: AppTextStyles.h2C,
//                     )),
//               ),
//               Container(
//                 width: 1,
//                 height: 40,
//                 color: AppColors.white54,
//                 margin: const EdgeInsets.only(left: 16, right: 16),
//               ),
//               Expanded(
//                 child: Container(
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.only(right: 16.0),
//                     child: const Text(
//                       'Giá \nniêm yết',
//                       style: AppTextStyles.h2C,
//                     )),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           height: size.width,
//           padding: const EdgeInsets.only(right: 24, left: 24),
//           child: StreamBuilder<AssetsResponse>(
//             stream: assestBloc.subject.stream,
//             builder: (context, AsyncSnapshot<AssetsResponse> snapshot) {
//               snapshot.data?.listAssest.map((e) {
//                 return e.name;
//               });
//               if (snapshot.hasData) {
//                 if (snapshot.data!.error.isNotEmpty) {
//                   return _buildErrorWidget(snapshot.data!.error);
//                 }
//                 return _buildListStock(size, snapshot.data!);
//               } else if (snapshot.hasError) {
//                 return _buildErrorWidget(snapshot.error.toString());
//               } else {
//                 return _buildLoadingWidget();
//               }
//             },
//           ),
//         )
//       ],
//     )));
//   }
// }

// Widget _buildErrorWidget(String error) {
//   return Center(
//       child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text("Error occured: $error"),
//     ],
//   ));
// }

// Widget _buildLoadingWidget() {
//   return Align(
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//           SizedBox(
//             height: 25.0,
//             width: 25.0,
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//               strokeWidth: 4.0,
//             ),
//           )
//         ],
//       ));
// }

// Widget _buildListStock(Size size, AssetsResponse data) {
//   final List<Assest> stockInit = data.listAssest;
//   return ListView.builder(
//     scrollDirection: Axis.vertical,
//     itemCount: stockInit.length,
//     itemBuilder: (context, index) {
//       // if (stockInit[index].symbol == "VND") {
//       //   return const SizedBox.shrink();
//       // }
//       // print(
//       //     'haha ${stockInit[index].symbol == "VND" ? stockInit[index].freeAsset : null}');
//       return Table(
//         textDirection: TextDirection.rtl,
//         defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
//         border: TableBorder.all(
//             // borderRadius: BorderRadius.circular(10),
//             width: 1.0,
//             color: AppColors.white54),
//         children: [
//           // TableRow(
//           //     decoration: BoxDecoration(
//           //       color: Color.fromARGB(16, 33, 149, 243),
//           //     ),
//           //     children: [
//           //       Padding(
//           //         padding: EdgeInsets.all(16.0),
//           //         child: Text("Cổ phiếu khóa", textScaleFactor: 1.2),
//           //       ),
//           //       Padding(
//           //         padding: EdgeInsets.all(16.0),
//           //         child: Text("Cổ phiếu hợp lệ", textScaleFactor: 1.2),
//           //       ),
//           //       Padding(
//           //         padding: EdgeInsets.all(16.0),
//           //         child: Text("Cổ phiếu", textScaleFactor: 1.2),
//           //       ),
//           //     ]),

//           // _buildTableRow(stockInit[index].symbol)

//           TableRow(children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 stockInit[index].lockedAsset ?? '',
//                 textScaleFactor: 1.2,
//                 style: const TextStyle(color: AppColors.red),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 stockInit[index].freeAsset ?? '',
//                 textScaleFactor: 1.2,
//                 style: const TextStyle(color: AppColors.green),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                   '${stockInit[index].symbol == 'VND' ? "Tài khoản" : stockInit[index].symbol}',
//                   textScaleFactor: 1.2),
//             ),
//           ]),
//         ],
//       );
//     },
//   );
// }

// TableRow _buildTableRow(String? name) {
//   return TableRow(
//     // key: ValueKey(item.id),
//     decoration: const BoxDecoration(
//       color: Colors.lightBlueAccent,
//     ),
//     children: [
//       Text(name ?? '', textScaleFactor: 1.2),
//     ], // Pass the widgets to be set as the row content.
//   );
// }


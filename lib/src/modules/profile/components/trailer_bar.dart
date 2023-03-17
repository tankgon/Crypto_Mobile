// import 'package:flutter/material.dart';

// // import '../movie_detail_page.dart';

// class TrailerBar extends StatelessWidget {
//   const TrailerBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: movies
//             .map((e) => Builder(builder: (context) {
//                   return Padding(
//                     padding: const EdgeInsets.only(left: 24),
//                     child: Stack(
//                       children: [
//                         Container(
//                           height: 160,
//                           width: 260,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(14),
//                               image: DecorationImage(
//                                   image: AssetImage(e.img), fit: BoxFit.cover)),
//                         ),
//                         Container(
//                           height: 160,
//                           width: 260,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(14),
//                               color: Colors.black45),
//                         ),
//                         SizedBox(
//                           height: 160,
//                           width: 260,
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(vertical: 56),
//                             decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.blueAccent),
//                             child: const Icon(
//                               Icons.play_arrow,
//                               size: 30,
//                               color: Colors.white,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 }))
//             .toList(),
//       ),
//     );
//   }
// }

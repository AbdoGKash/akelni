// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
// import 'package:flutter_application_1/features/home/data/model/home_model.dart';

// import '../../../core/theming/text_styel.dart';

// class CounterItem extends StatefulWidget {
//   const CounterItem({super.key});

//   @override
//   State<CounterItem> createState() => _CounterItemState();
// }

// class _CounterItemState extends State<CounterItem> {
//   int counter = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//             onPressed: () {
//               setState(() {
//                 counter++;
//               });
//             },
//             icon: const Icon(Icons.add)),
//         Text(
//           "$counter",
//           style: TextStyles.font20BlackBold,
//         ),
//         IconButton(
//             onPressed: () {
//               setState(() {
//                 counter--;
//               });
//             },
//             icon: const Icon(Icons.remove)),
//       ],
//     );
//   }
// }

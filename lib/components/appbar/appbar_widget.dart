
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:netflix_app/constants/spaces.dart';

import '../../Pages/search_screen.dart';

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({super.key, required this.title,this.bottom});
//   final String title;
//   final PreferredSize? bottom;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 23,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       actions: [
//         IconButton(
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenSearch()));
//             },
//             icon: const Icon(
//               EvaIcons.search,
//               size: 28,
//             )),
//         space10,
//         Container(
//           margin: const EdgeInsets.symmetric(vertical: 10),
//           decoration: BoxDecoration(
//               color: Colors.greenAccent,
//               borderRadius: BorderRadius.circular(6)),
//           width: 28,
//         ),
//         space10
//       ],
//       bottom: bottom,
//     );
//   }
// }
 AppBar appbarWidget({required String title, PreferredSize? bottom,BuildContext? context,bool notification=false}) {
    return AppBar(
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          notification?const Icon(Icons.notifications_none_sharp,size: 28,):const SizedBox(),
          space10,
         context!=null?  IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenSearch()));
            },
            icon: const Icon(
              EvaIcons.search,
              size: 28,
            )):const SizedBox(),
          space10,
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(6)),
            width: 28,
          ),
          space10
        ],
        bottom: bottom);
  }
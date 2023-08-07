
// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:netflix_app/constants/colors.dart';

import '../../constants/spaces.dart';

class SearchBarWidget extends StatelessWidget {
 const  SearchBarWidget({
    super.key,
    required this.deviceSize,
    this.search
  });

  final Size deviceSize;
  
   final ValueNotifier<TextEditingController>? search;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: deviceSize.width,
      color: const Color(0xff262626),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Icon(
            EvaIcons.search,
            color: whiteCl.withOpacity(.6),
            size: 30,
          ),
          space10,
           Expanded(
            child: TextField(
              controller: search!.value,
              style:const TextStyle(
                  color: whiteCl, decoration: TextDecoration.none),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search titles,generes or people',
                  hintStyle: TextStyle(color:whiteCl.withOpacity(.6))
                  ),
                  onChanged: (value) {
                    search!.notifyListeners();
                  },
            ),
          ),
          Icon(Icons.mic_none_rounded,size: 30,color: whiteCl.withOpacity(.6),),
          space10
        ],
      ),
    );
  }
}

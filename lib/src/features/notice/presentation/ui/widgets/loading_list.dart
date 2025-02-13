

import 'package:flutter/material.dart';
import 'package:hrm/src/core/utils/shimmers.dart';

class LoadingNoticeList extends StatelessWidget {
  const LoadingNoticeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index){
        return commonShimmer(
          height: 70,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
          radius: 16
        );
      }),
    );
  }
}

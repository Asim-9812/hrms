

import 'package:flutter/material.dart';
import 'package:hrm/src/core/utils/shimmers.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';

class LoadingHomeNotices extends StatelessWidget {
  const LoadingHomeNotices({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Notices',style: bh1,),
          h10,
          AspectRatio(
              aspectRatio: 2.5,
              child: commonShimmer(
                radius: 16,
              )),
        ],
      ),
    );
  }
}

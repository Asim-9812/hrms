

import 'package:flutter/material.dart';
import 'package:hrm/src/core/resources/color_manager.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';

class NoHomeNotices extends StatelessWidget {
  final String error;
  const NoHomeNotices({required this.error,super.key});

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
              child: Container(
                decoration: BoxDecoration(
                    color: MyColors.primary,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Center(child: Text(error,style: wr1,)),
              )
          ),
        ],
      ),
    );
  }
}

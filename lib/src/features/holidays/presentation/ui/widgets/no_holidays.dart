
import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';

class NoHolidays extends StatelessWidget {
  const NoHolidays({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        h10,
        Text('No public holidays for this month.',style: br1,),
      ],
    ));
  }
}




import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/utils/router.dart';
import 'package:hrm/src/features/dashboard/application/controller/dashboard_controller.dart';
import 'package:hrm/src/features/utilities/data/utilities_list.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';

class Utilities extends ConsumerWidget {
  const Utilities({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final utilities = utilitiesList;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: utilities.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1,crossAxisSpacing: 16,mainAxisSpacing: 10),
          itemBuilder: (context, index){
            final utility = utilities[index];
            return InkWell(
              onTap:utility['index'] == null ? null : (){
                ref.read(dashboardController.notifier).changeIndex(utility['index'] as int, utility['name'] as String);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.primaryLighter,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(utility['image'] as String),
                        h10,
                        Text(utility['name'] as String,style: bh3,maxLines: 1,)
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}

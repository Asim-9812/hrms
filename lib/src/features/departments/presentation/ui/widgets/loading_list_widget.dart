

import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../../../core/utils/shimmers.dart';

class LoadingListWidget extends StatelessWidget {
  const LoadingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: br2,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: MyColors.primary
                  )
              ),
              enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: MyColors.primary
                  )
              ),
              labelText: 'Search',
              hintText: 'Search for departments...',
              labelStyle: br3,
              hintStyle: br4,
              prefixIcon: Icon(Icons.search,color: MyColors.primary,)
          ),
        ),
        h10,
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context,index){
              return commonShimmer(
                  radius: 12,
                  height: 50,
                  margin: EdgeInsets.only(bottom: 4,top: 4)
              );
            },
          ),
        ),
      ],
    );
  }
}





import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/features/banners/application/controller/banner_controller.dart';
import 'package:hrm/src/features/banners/data/sample_banner_list.dart';

import '../../../../core/resources/gap_manager.dart';

class Banners extends ConsumerWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final index = ref.watch(bannerController).index;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider(
            items: bannerList.map((e){
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8.0),
                decoration: BoxDecoration(
                    color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(image: AssetImage(e),fit: BoxFit.cover)
                ),
              );
            }).toList(),
            options: CarouselOptions(
              aspectRatio: 2.5,
              initialPage: index,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              enlargeCenterPage: true,
              pageSnapping: true,
              viewportFraction: 1,
              onPageChanged: (index,reason){
                ref.read(bannerController.notifier).changeIndex(index);
              }
            )
        ),
        h10,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(bannerList.length, (newIndex){
            return AnimatedContainer(
              duration: Duration(milliseconds: 250),
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: index == newIndex? MyColors.secondary : MyColors.grey
              ),
              width: index == newIndex? 20 : 8,
              padding: EdgeInsets.all(4),
            );
          }),
        )
      ],
    );
  }
}

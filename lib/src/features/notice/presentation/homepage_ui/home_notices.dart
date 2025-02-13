




import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';
import '../../../../core/utils/router.dart';
import '../../application/controller/homepage_notice_controller.dart';
import '../../application/providers/notice_providers.dart';
import '../ui/notices.dart';
import 'widgets/container_template.dart';
import 'widgets/loading_home_notices.dart';
import 'widgets/no_notices.dart';

class HomeNotices extends ConsumerWidget {
  const HomeNotices({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final index = ref.watch(homepageNoticeController).index;
    final noticeAsyncValue = ref.watch(noticeProviders);
    return noticeAsyncValue.when(
        data: (notices){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Notices',style: bh1,),
                    InkWell(
                        onTap: ()=>routeTo(context, Notices()),
                        child: Text('View all',style: TextStyle(color: MyColors.primary,fontSize: 16,fontWeight: FontWeight.w500),))
                  ],
                ),
              ),
              h10,
              CarouselSlider(
                  items: notices.map((e)=>NoticeContainer(noticeData: e)).toList(),
                  options: CarouselOptions(
                      aspectRatio: 2.5,
                      initialPage: index,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 9),
                      enlargeCenterPage: false,
                      pageSnapping: true,
                      viewportFraction: 1,
                      onPageChanged: (index,reason){
                        ref.read(homepageNoticeController.notifier).changeIndex(index);
                      }
                  )
              ),
              h10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(notices.length, (newIndex){
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: index == newIndex? MyColors.primary : MyColors.grey
                    ),
                    width: index == newIndex? 20 : 8,
                    padding: EdgeInsets.all(4),
                  );
                }),
              )
            ],
          );
        },
        error: (error,stack)=>NoHomeNotices(error: '$error',),
        loading: ()=>LoadingHomeNotices()
    );
  }
}

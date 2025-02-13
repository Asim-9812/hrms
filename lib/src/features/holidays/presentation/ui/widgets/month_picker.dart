



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:intl/intl.dart';
import 'package:hrm/src/features/holidays/application/controller/holidays_controller.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';

class MonthPicker extends ConsumerWidget {
  const MonthPicker({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final selectedDate = ref.watch(holidayController).selectedDate;
    
    final month = DateFormat('MMMM').format(selectedDate);
    final monthIndex= selectedDate.month;
    final year = DateFormat('yyyy').format(selectedDate);
    final focusedStyle = TextStyle(fontSize: 36,fontWeight: FontWeight.w500);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(year,style: bh2,),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: InkWell(
                        onTap: monthIndex == 1 ? null :(){
                          final newDate = DateTime(selectedDate.year,selectedDate.month-1,1);
                          ref.read(holidayController.notifier).changeDate(newDate);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: monthIndex == 1 ? MyColors.grey : MyColors.primary,
                            borderRadius: BorderRadius.circular(4)
                          ),
                          width: 30,
                          height: 30,
                          child: Icon(Icons.arrow_left,color: MyColors.white,),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Center(child: Text(month,style: focusedStyle,))),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: InkWell(
                        onTap:monthIndex == 12 ? null :(){
                          final newDate = DateTime(selectedDate.year,selectedDate.month+1,1);
                          ref.read(holidayController.notifier).changeDate(newDate);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: monthIndex == 12 ? MyColors.grey : MyColors.primary,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          width: 30,
                          height: 30,
                          child: Icon(Icons.arrow_right,color: MyColors.white,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          
            ],
          )
          
          // Text('2025',style: bh2,),
          // Container(
          //   // color: Colors.red,
          //   child: Stack(
          //     children: [
          //       CarouselSlider(
          //         carouselController: controller,
          //           items: monthList.map((e)=>Text(e,style: e.toLowerCase() == month.toLowerCase() ? focusedStyle : unfocusedStyle,)).toList(),
          //           options: CarouselOptions(
          //             aspectRatio: 4,
          //             enableInfiniteScroll: false,
          //             initialPage: monthIndex,
          //             autoPlay: false,
          //             viewportFraction: 0.4,
          //             enlargeCenterPage: true,
          //             // pageSnapping: true,
          //             onPageChanged: (index,reason){
          //               final newDate = DateTime(selectedDate.year,index+1,1);
          //               ref.read(holidayController.notifier).changeDate(newDate);
          //             },
          //           )
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           IconButton(
          //             color: MyColors.primary,
          //             disabledColor: MyColors.grey,
          //               onPressed: monthIndex == 0 ? null : (){
          //                 ref.read(holidayController.notifier).updateController(monthIndex-1);
          //               },
          //               icon: Icon(Icons.chevron_left,size: 32,)
          //           ),
          //           w30,
          //           IconButton(
          //             color: MyColors.primary,
          //             disabledColor: MyColors.grey,
          //               onPressed: monthIndex == 11 ? null : (){
          //                 ref.read(holidayController.notifier).updateController(monthIndex+1);
          //               },
          //               icon: Icon(Icons.chevron_right,size: 32,)
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

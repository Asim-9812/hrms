

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/calendar/domain/model/calendar_model.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../application/controller/calendar_controller.dart';

class FocusedEvent extends ConsumerWidget {
  final List<CalendarModel> calendarData;
  const FocusedEvent({required this.calendarData,super.key});

  @override
  Widget build(BuildContext context, ref) {

    final focusedDay = ref.watch(calendarController).selectedDate;
    final selectedDate = DateFormat('dd').format(focusedDay);
    final selectedDay = DateFormat('EEEE').format(focusedDay);
    final selectedMonthYear = DateFormat('MMMM yyyy').format(focusedDay);
    final focusedList = calendarData.where((e)=> isSameDay(e.startDate, focusedDay)).toList();
    final index = ref.watch(calendarController).carouselIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(selectedMonthYear,style: ph3,),
              Text(selectedDate,style: ph1,),
              Text(selectedDay,style: ph3,),
            ],
          ),
          w10,
          SizedBox(
            height: 100,
            child: VerticalDivider(
              endIndent: 16,
              indent: 16,
            ),
          ),
          w10,
          if(focusedList.isNotEmpty)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                      items: focusedList.map((e){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title,style: e.eventType == 1 ? rh2 : bh2,maxLines: 1,),
                            Text(e.description,style: br1,maxLines: 2,)
                          ],
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 80,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: focusedList.length > 1? true : false,
                        enlargeCenterPage: false,
                        autoPlay: false,
                        disableCenter: true,
                        onPageChanged: (index, reason) => ref.read(calendarController.notifier).changeIndex(index),
                      )
                  ),
                  if(focusedList.length > 1)
                    h10,
                  if(focusedList.length > 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(focusedList.length, (newIndex){
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: index == newIndex? MyColors.primary : MyColors.grey
                          ),
                          width: 8,
                          padding: EdgeInsets.all(4),
                        );
                      }),
                    )
                ],
              ),
            ),
          if(focusedList.isEmpty)
            Expanded(child: Text('No Events or Holidays', style: bh2,maxLines: 2,))

        ],
      ),
    );
  }
}

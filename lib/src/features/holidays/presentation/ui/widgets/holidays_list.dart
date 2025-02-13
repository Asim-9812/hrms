



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/utils/shimmers.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/holidays/application/controller/holidays_controller.dart';
import 'package:hrm/src/features/holidays/application/controller/holidays_list_controller.dart';
import 'package:hrm/src/features/holidays/application/providers/holiday_providers.dart';
import 'package:hrm/src/features/holidays/presentation/ui/widgets/no_holidays.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';

class HolidaysList extends ConsumerWidget {
  const HolidaysList({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final holidayAsyncValue = ref.watch(holidayProviders);

    return holidayAsyncValue.when(
        data: (holidayListData){
          final holidayList = ref.watch(getHolidays(holidayListData));

          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  height: 30,
                  indent: 16,
                  endIndent: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Holidays',style: bh1,),
                ),
                holidayList.isEmpty
                    ? NoHolidays()
                    : Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    itemCount: holidayList.length,
                    itemBuilder: (context, index){
                      final holiday = holidayList[index];
                      final date = DateFormat('yyyy-MM-ddThh:mm:ss').parse(holiday.startDate!);
                      final day = DateFormat('EEEE').format(date);
                      final month_day = DateFormat('MMM dd').format(date);
                      return ListTile(
                        tileColor: MyColors.lightGrey,
                        // contentPadding: EdgeInsets.zero,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        leading: BulletinPoint(),
                        title: Text(holiday.holidayTitle!,style: bh2,maxLines: 1,),
                        subtitle: Text(holiday.description!,style: br2,maxLines: 1,),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(month_day,style: bh2,maxLines: 1,),
                            Text(day,style: br3,maxLines: 1,),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index){
                      return h10;
                    },

                  ),
                ),

              ],
            ),
          );
        },
        error: (error, stack)=>NoHolidays(),
        loading: (){
          return Column(
            children: [
              commonShimmer(
                radius: 12,
                height: 70,
                margin: EdgeInsets.symmetric(horizontal: 16)
              ),
              h10,
              commonShimmer(
                  radius: 12,
                  height: 70,
                  margin: EdgeInsets.symmetric(horizontal: 16)
              ),
            ],
          );
        }
    );
  }
}

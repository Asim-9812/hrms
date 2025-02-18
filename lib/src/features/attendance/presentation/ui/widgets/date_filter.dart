


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../../../core/utils/date_input_formatter.dart';
import '../../../application/controller/attendance_date_controller.dart';
import '../../../application/controller/attendance_list_controller.dart';

class DateFilter extends ConsumerWidget {
  const DateFilter({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final fromController = ref.watch(attendanceListController).fromDateController;
    final toController = ref.watch(attendanceListController).toDateController;
    final key = ref.watch(attendanceListController).formKey;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Form(
            key: key,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: fromController,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'From Date',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        suffixIcon: IconButton(
                            onPressed: () => fromDateDialog(context, ref),
                            icon: Icon(Icons.calendar_month,color: MyColors.primary,)
                        )
                    ),
                    validator: (val){
                      final now = DateTime.now();

                      if(val == null || val.trim().isEmpty){
                        return 'Date is required';
                      }
                      try{
                        final currentDate = DateFormat('yyyy-MM-dd').parse(val);
                        if(currentDate.isAfter(now)){
                          return 'Invalid Date';
                        }
                        else{
                          return null;
                        }
                      }catch(e){
                        return 'Invalid Format';
                      }
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      DateInputFormatter()
                    ],
                  ),
                ),
                w10,
                Expanded(
                  child: TextFormField(
                    controller: toController,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'To Date',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        suffixIcon: IconButton(
                            onPressed: () => toDateDialog(context, ref),
                            icon: Icon(Icons.calendar_month,color: MyColors.primary,)
                        )
                    ),
                    validator: (val){
                      final now = DateTime.now();

                      if(val == null || val.trim().isEmpty){
                        return 'Date is required';
                      }
                      try{
                        final currentDate = DateFormat('yyyy-MM-dd').parse(val);
                        if(currentDate.isAfter(now)){
                          return 'Invalid Date';
                        }
                        else{
                          return null;
                        }
                      }catch(e){
                        return 'Invalid Format';
                      }
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      DateInputFormatter()
                    ],
                  ),
                ),
              ],
            ),
          ),
          h08,
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: MyColors.primary,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              onPressed: (){}, 
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search,color: MyColors.white,),
                  w10,
                  Text('Search',style: wr1,)
                ],
          ))
        ],
      ),

    );
  }
}

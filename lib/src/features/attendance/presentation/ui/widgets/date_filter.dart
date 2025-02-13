


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../../../core/utils/date_input_formatter.dart';
import '../../../application/controller/attendance_date_controller.dart';
import '../../../application/controller/attendance_list_controller.dart';

class DateFilter extends ConsumerWidget {
  const DateFilter({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final controller = ref.watch(attendanceListController).dateController;
    final key = ref.watch(attendanceListController).formKey;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Form(
              key: key,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Date',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)
                    ),
                    suffixIcon: IconButton(
                        onPressed: () => dateDialog(context, ref),
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
                      return 'Date is after current date';
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
          ),
          w06,
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: MyColors.primary,
                foregroundColor: MyColors.white,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )
              ),
              onPressed: (){
                key.currentState?.validate();
              }, icon: Icon(Icons.search))
        ],
      ),

    );
  }
}

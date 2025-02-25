


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/utils/date_input_formatter.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/resources/font_manager.dart';
import '../../../../../../core/resources/gap_manager.dart';
import '../../../../application/controller/leave_request_controller.dart';

class LeaveRequest extends ConsumerWidget {
  const LeaveRequest({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final global = ref.watch(leaveRequestController);
    final formKey = global.formKey;
    final typeController = global.typeController;
    final reasonController = global.reasonController;
    final fromController = global.fromController;
    final toController = global.toController;
    final totalController = global.totalController;

    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CommonNavBar(name: 'Leave Request'),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: typeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: MyColors.primary
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: MyColors.primary
                          )
                      ),
                      labelText: 'Leave Type',
                    ),
                    validator: (value) {
                      if(value == null || value.trim().isEmpty){
                        return 'Leave type is required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  h10,
                  TextFormField(
                    controller: reasonController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: MyColors.primary
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: MyColors.primary
                          )
                      ),
                      labelText: 'Reason',
                    ),
                    validator: (value) {
                      if(value == null || value.trim().isEmpty){
                        return 'Reason is required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  h10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          controller: fromController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: MyColors.primary
                              )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: MyColors.primary
                                )
                            ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: MyColors.primary
                                  )
                              ),
                            labelText: 'From Date',
                            suffixIcon: IconButton(
                                onPressed: () => datePicker(context, ref, fromController, 1),
                                icon: Icon(Icons.calendar_month,color: MyColors.primary,)
                            )
                          ),
                          onTap: () => datePicker(context, ref, fromController, 1),
                          validator: (value) {
                            if(value == null || value.trim().isEmpty){
                              return 'From Date is required';
                            }
                            else if(toController.text.trim().isNotEmpty){
                              DateTime toDate = DateFormat('yyyy-MM-dd').parse(toController.text);
                              DateTime fromDate = DateFormat('yyyy-MM-dd').parse(value);
                              if(toDate.isBefore(fromDate)){
                                return 'To date before from date';
                              }
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            DateInputFormatter()
                          ],
                        ),
                      ),
                      w10,
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          controller: toController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: MyColors.primary
                              )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: MyColors.primary
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: MyColors.primary
                                )
                            ),
                            labelText: 'To Date',
                            suffixIcon: IconButton(
                                onPressed: () => datePicker(context, ref, toController, 2),
                                icon: Icon(Icons.calendar_month,color: MyColors.primary,)
                            )
                          ),
                          onTap: () => datePicker(context, ref, toController, 2),
                          validator: (value) {
                            if(value == null || value.trim().isEmpty){
                              return 'To Date is required';
                            }
                            else if(fromController.text.trim().isNotEmpty){
                              DateTime toDate = DateFormat('yyyy-MM-dd').parse(value);
                              DateTime fromDate = DateFormat('yyyy-MM-dd').parse(fromController.text);
                              if(toDate.isBefore(fromDate)){
                                return 'To date before from date';
                              }
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            DateInputFormatter()
                          ],
                        ),
                      ),
                    ],
                  ),
                  h10,
                  TextFormField(
                    controller: totalController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: MyColors.primary
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: MyColors.primary
                          )
                      ),
                      labelText: 'Total days',
                    ),
                    validator: (value) {
                      if(value == null || value.trim().isEmpty){
                        return 'Total days is required';
                      }
                      return null;
                    },
                    onChanged: (val){
                      if(val != '0' && fromController.text.trim().isNotEmpty){
                        ref.read(leaveRequestController.notifier).updateToDate(int.parse(val));
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  h20,
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: MyColors.primary,
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                )
                            ),
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Send Request',style: wr1,)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void datePicker(context,WidgetRef ref,TextEditingController controller,int value) async{ //value == 1 : fromDate || value == 2 : toDate

    final fromDate = ref.watch(leaveRequestController).fromDate;
    final toDate = ref.watch(leaveRequestController).toDate;
    final totalController = ref.watch(leaveRequestController).totalController;
    final fromController = ref.watch(leaveRequestController).fromController;

    
    DateTime? selectedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if(selectedDate != null){
      final dateString = DateFormat('yyyy-MM-dd').format(selectedDate);
      controller.text = dateString;
      if(value == 1){
        ref.read(leaveRequestController.notifier).changeFromDate(selectedDate);
        if(toDate.day - fromDate.day > 0){
          ref.read(leaveRequestController.notifier).updateTotalDays();
        }
        if(totalController.text.trim().isNotEmpty){
          final value = int.parse(totalController.text);
          ref.read(leaveRequestController.notifier).updateToDate(value);
        }
      }
      else if(value == 2){
        ref.read(leaveRequestController.notifier).changeToDate(selectedDate);
        if(toDate.isAfter(fromDate) && fromController.text.trim().isNotEmpty){
          ref.read(leaveRequestController.notifier).updateTotalDays();
        }
      }

    }

  }

}

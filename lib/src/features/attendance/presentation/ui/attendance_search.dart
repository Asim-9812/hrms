import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/attendance/application/controller/attendance_controller.dart';
import 'package:hrm/src/features/attendance/application/provider/attendance_provider.dart';
import 'package:intl/intl.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';



class AttendanceSearch extends ConsumerWidget {
  const AttendanceSearch({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentYear = ref.watch(attendanceController).year;
    final currentMonth = ref.watch(attendanceController).month;
    final int todayYear = DateTime.now().year;
    final int todayMonth = DateTime.now().month;
    final selectedDate = DateTime(currentYear,currentMonth,01);

    // Generate list of years from 2023 to the current year
    final List<DropdownMenuEntry<int>> yearEntries =
    List.generate(todayYear - 2023 + 1, (index) {
      int year = 2023 + index;
      return DropdownMenuEntry<int>(value: year, label: year.toString());
    });

    // Generate list of months ensuring the current month appears last
    final List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    // Adjust months list if the selected year is the current year
    final List<String> availableMonths = (currentYear == todayYear)
        ? months.sublist(0, todayMonth) // Only include months up to the current month
        : months;

    final List<DropdownMenuEntry<String>> monthEntries = availableMonths
        .map((month) => DropdownMenuEntry<String>(value: month, label: month))
        .toList();

    final attendanceAsyncValue = ref.watch(attendanceProvider(selectedDate));

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CommonNavBar(name: 'Attendance List'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: DropdownMenu<String>(
                            width: double.infinity,
                            initialSelection: months[currentMonth-1],
                            onSelected: (value) {

                              int index = months.indexOf(value!) + 1;

                              ref.read(attendanceController.notifier).changeMonth(index);
                            },
                            dropdownMenuEntries: monthEntries),
                      ), // Month selection
                      w10,
                      Expanded(
                        flex: 1,
                        child: DropdownMenu<int>(
                            width: double.infinity,
                            initialSelection: currentYear,
                            onSelected: (value) {
                              ref.read(attendanceController.notifier).changeYear(value!);
                            },
                            dropdownMenuEntries: yearEntries),
                      ), // Year selection
                    ],
                  ),
                  // h10,
                  // TextButton(
                  //     style: TextButton.styleFrom(
                  //       backgroundColor: MyColors.primary,
                  //       shape: ContinuousRectangleBorder(
                  //           borderRadius: BorderRadius.circular(12)
                  //       ),
                  //     ),
                  //     onPressed: (){},
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Icon(Icons.search,color: MyColors.white,),
                  //         w10,
                  //         Text('Search',style: wr1,)
                  //       ],
                  //     )
                  // )
                ],
              ),
            ),
            h20,
            ListTile(
              tileColor: MyColors.primary,
              title: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Date',style: wr1,maxLines: 1,),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(child: Text('In',style: wr1,)),
                  ),
                  w20,
                  Expanded(
                    flex: 1,
                    child: Center(child: Text('Out',style: wr1,)),
                  ),
                ],
              ),
            ),
            attendanceAsyncValue.when(
                data: (attendanceData){
                  if(attendanceData.isEmpty){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('No records found',style: br1,),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: attendanceData.length,
                        itemBuilder: (context, index){
                          final attendanceInfo = attendanceData[index];
                          final date = DateFormat('yyyy-MM-ddThh:mm:ss').parse(attendanceInfo.date!);
                          final dateString = DateFormat('yyyy-MM-dd').format(date);
                          final checkIn = attendanceInfo.checkInTime ?? '-';
                          final checkOut = attendanceInfo.checkOutTime ?? '-';
                          return Material(
                            color: MyColors.lightGrey,
                            child: ListTile(
                              tileColor: MyColors.lightGrey,
                              title: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(dateString,style: br1,maxLines: 1,),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child:  Center(child: Text(checkIn,style: br2,maxLines: 1,))
                                  ),
                                  w20,
                                  Expanded(
                                      flex: 1,
                                      child: Center(child: Text(checkOut,style: br2,maxLines: 1,))
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  );

                },
                error: (error,stack)=>Column(
                  children: [
                    h30,
                    Center(
                      child: Text('$error',style: br2,),
                    ),
                  ],
                ),
                loading: ()=>Column(
                  children: [
                    h30,
                    Center(
                      child: SpinKitDualRing(color: MyColors.primary,size: 16,),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}

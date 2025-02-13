


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/attendance/presentation/ui/widgets/date_filter.dart';
import 'package:hrm/src/features/attendance/presentation/ui/widgets/request_attendance.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';

class Attendance extends ConsumerWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context, ref) {


    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        // appBar: CommonNavBar(name: 'Attendance List'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RequestAttendance(),
              DateFilter(),
              h20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: br2,
                    hintText: 'Search for anything...',
                    hintStyle: br3,
                    prefixIcon: Icon(Icons.search,color: MyColors.primary,),
                    border: UnderlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListTile(
                  tileColor: MyColors.primary,
                  title: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('Employee name',style: wr1,maxLines: 1,),
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListTile(
                  tileColor: MyColors.lightGrey,
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('John Doe',style: br1,maxLines: 1,),
                            Text('Web Developer',style: br2,maxLines: 1,)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:  Center(child: Text('06:44 AM',style: br2,maxLines: 1,))
                      ),
                      w20,
                      Expanded(
                        flex: 1,
                        child: Center(child: Text('06:00 PM',style: br2,maxLines: 1,))
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListTile(
                  tileColor: MyColors.lightGrey,
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('John Doe',style: br1,maxLines: 1,),
                            Text('Web Developer',style: br2,maxLines: 1,)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:  Center(child: Text('06:44 AM',style: br2,maxLines: 1,))
                      ),
                      w20,
                      Expanded(
                        flex: 1,
                        child: Center(child: Text('06:00 PM',style: br2,maxLines: 1,))
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListTile(
                  tileColor: MyColors.lightGrey,
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('John Doe',style: br1,maxLines: 1,),
                            Text('Web Developer',style: br2,maxLines: 1,)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:  Center(child: Text('06:44 AM',style: br2,maxLines: 1,))
                      ),
                      w20,
                      Expanded(
                        flex: 1,
                        child: Center(child: Text('06:00 PM',style: br2,maxLines: 1,))
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

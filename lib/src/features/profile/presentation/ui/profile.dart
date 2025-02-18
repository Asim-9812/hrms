


import 'package:flutter/material.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonNavBar(name: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.zero,
                child: SizedBox(
                  width: double.infinity,
                  // height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.edit))),
                      Card(
                        shape: CircleBorder(
                          side: BorderSide(
                            color: MyColors.black
                          )
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          child: Icon(Icons.person),
                        ),
                      ),
                      Text('Username',style: bh2,),
                      h04,
                      Text('Developer',style: br2,),
                      Text('user@gmail.com',style: br2,),
                      h20,
                    ],
                  ),
                ),
              ),
              h10,
              ListTile(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(
                    color: MyColors.grey
                  )
                ),
                leading: CircleAvatar(
                  backgroundColor: MyColors.secondary.withValues(alpha: 220),
                  child: Icon(Icons.perm_identity_rounded,color: MyColors.secondary,),
                ),
                title: Text('My Details',style: bh2,),
                trailing: Icon(Icons.chevron_right_rounded),
              ),
              h10,
              ListTile(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(
                        color: MyColors.grey
                    )
                ),
                leading: CircleAvatar(
                  backgroundColor: MyColors.yellow.withValues(alpha: 220),
                  child: Icon(Icons.groups,color: MyColors.yellow,),
                ),
                title: Text('My Team',style: bh2,),
                trailing: Icon(Icons.chevron_right_rounded),
              ),
              h10,
              ListTile(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(
                    color: MyColors.grey
                  )
                ),
                leading: CircleAvatar(
                  backgroundColor: MyColors.green.withValues(alpha: 220),
                  child: Icon(Icons.payments_rounded,color: MyColors.green,),
                ),
                title: Text('My Payslips',style: bh2,),
                trailing: Icon(Icons.chevron_right_rounded),
              ),
          
              h10,
              ListTile(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(
                        color: MyColors.grey
                    )
                ),
                leading: CircleAvatar(
                  backgroundColor: MyColors.blue.withValues(alpha: 220),
                  child: Icon(Icons.timelapse_rounded,color: MyColors.blue,),
                ),
                title: Text('Overtime',style: bh2,),
                trailing: Icon(Icons.chevron_right_rounded),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}

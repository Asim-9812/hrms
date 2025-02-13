

import 'package:flutter/material.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';

class NoNotifications extends StatelessWidget {
  const NoNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        return Future.value(true);
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity,),
            Image.asset('assets/images/no_notifications.png'),
            h20,
            Text('No notifications',style: bh2,),


          ],
        ),
      ),
    );
  }
}

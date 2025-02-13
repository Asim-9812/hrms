

import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';

class RequestAttendance extends StatelessWidget {
  const RequestAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: MyColors.primary,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
                onPressed: (){},
                child: Text('Request for attendance',style: wr2,)),
          ),
        ],
      ),
    );
  }
}

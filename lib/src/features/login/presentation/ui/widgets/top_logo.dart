
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: FadeIn(
          duration: Duration(seconds: 2),
          child: ZoomIn(
            duration: Duration(seconds: 1),
            child: Center(
              child: CircleAvatar(
                backgroundColor: MyColors.white,
                radius: 70,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: MyColors.white,
                    backgroundImage: AssetImage('assets/images/fav.jpg'),),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

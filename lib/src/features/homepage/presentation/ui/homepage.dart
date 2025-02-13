




import 'package:flutter/material.dart';
import 'package:hrm/src/features/banners/presentation/ui/banners.dart';
import 'package:hrm/src/features/notice/presentation/homepage_ui/home_notices.dart';
import 'package:hrm/src/features/utilities/presentation/ui/utilities.dart';

import '../../../../core/resources/gap_manager.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            h08,
            Banners(),
            h20,
            HomeNotices(),
            h20,
            Utilities(),
            h100
          ],
        ),
      ),
    );
  }
}

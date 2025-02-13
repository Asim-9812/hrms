


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';
import 'package:hrm/src/features/admin_dashboard/presentation/ui/admin_dashboard.dart';
import 'package:hrm/src/features/dashboard/application/controller/dashboard_controller.dart';
import 'package:hrm/src/features/dashboard/data/sample_data/dashboard_pages_list.dart';
import 'package:hrm/src/features/dashboard/presentation/ui/widgets/appbar_widgets/drawer.dart';
import 'package:hrm/src/features/homepage/presentation/ui/homepage.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/gap_manager.dart';
import 'widgets/appbar_widgets/dashboard_appbar.dart';


class Dashboard extends ConsumerWidget {
  Dashboard({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ref) {

    // final index = ref.watch(dashboardController).dashboardIndex;
    // final controller = ref.watch(dashboardController).pageController;
    // final pageName = ref.watch(dashboardController).activeIndexPage;

    return Scaffold(
      key: scaffoldKey,
      appBar: DashboardAppbar(context, 'HR Management System'),
      drawer: DashboardDrawer(),
      body: Homepage(),

    );
  }



}

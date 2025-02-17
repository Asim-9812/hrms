


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../homepage/presentation/ui/homepage.dart';
import 'widgets/appbar_widgets/dashboard_appbar.dart';
import 'widgets/appbar_widgets/drawer.dart';


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

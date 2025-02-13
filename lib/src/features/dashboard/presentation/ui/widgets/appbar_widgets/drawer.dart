import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/utils/router.dart';
import 'package:hrm/src/features/dashboard/application/controller/dashboard_controller.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/font_manager.dart';
import '../../../../../../core/resources/gap_manager.dart';
import '../../../../../../core/widgets/common_widgets.dart';
import '../../../../data/sample_data/menu_list.dart';

class DashboardDrawer extends ConsumerWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final pageName = ref.watch(dashboardController).activeIndexPage;

    return Drawer(
      shape: ContinuousRectangleBorder(),
      width: 250,
      elevation: 0,
      child: Column(
        children: [
          SafeArea(child: DashboardLogo()),
          h20,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: dashboardItems.map((item) {

                  if (item.isExpansionTile) {
                    return _drawerExpansionTile(
                      icon: item.icon,
                      title: item.title,
                      children: item.children.map((child) {
                        return _drawerTiles(
                          icon: child.icon,
                          name: child.title,
                          onTap: () => onTapIndex(context, child.route!),
                        );
                      }).toList(),
                    );
                  } else {
                    return _drawerTiles(
                      icon: item.icon,
                      name: item.title,
                      onTap: () => onTapIndex(context, item.route!),
                    );
                  }
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerTiles({
    required IconData icon,
    required String name,
    required VoidCallback onTap,
  }) {
    return Material(
      color: MyColors.transparent,
      child: ListTile(
        onTap: onTap,
        tileColor: MyColors.transparent,
        leading: Icon(icon, color: MyColors.primary),
        title: Text(name, style: br1, maxLines: 1,),
      ),
    );
  }

  Widget _drawerExpansionTile({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Material(
      color:MyColors.transparent,
      child: ExpansionTile(
        leading: Icon(icon, color: MyColors.primary),
        title: Text(title, style: br1,maxLines: 1,),
        backgroundColor: MyColors.white,
        iconColor: MyColors.primary,
        shape: ContinuousRectangleBorder(),
        collapsedBackgroundColor: MyColors.transparent,
        children: children,
      ),
    );
  }

  void onTapIndex(BuildContext context, Widget widget)=> routeTo(context, widget);
}

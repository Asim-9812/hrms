import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/dashboard/application/controller/dashboard_controller.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/font_manager.dart';
import '../../../../../../core/resources/gap_manager.dart';
import '../../../../../../core/widgets/common_widgets.dart';
import '../../../../data/sample_data/sample_menu_list.dart';

class DashboardDrawer extends ConsumerWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pageName = ref.watch(dashboardController).activeIndexPage;

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
                  // Determine if the expansion tile should be marked as active
                  bool isExpansionTileActive = item.isExpansionTile && item.children.any((child) => child.title == pageName);

                  if (item.isExpansionTile) {
                    return _drawerExpansionTile(
                      icon: item.icon,
                      title: item.title,
                      isActive: isExpansionTileActive,
                      children: item.children.map((child) {
                        return _drawerTiles(
                          icon: child.icon,
                          name: child.title,
                          isActive: pageName == child.title,
                          onTap: () => onTapIndex(ref, child.index, child.title),
                        );
                      }).toList(),
                    );
                  } else {
                    return _drawerTiles(
                      icon: item.icon,
                      name: item.title,
                      isActive: pageName == item.title,
                      onTap: () => onTapIndex(ref, item.index, item.title),
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
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Material(
      color: isActive ? MyColors.primaryLight : MyColors.transparent,
      child: ListTile(
        onTap: onTap,
        tileColor: isActive ? MyColors.primaryLight : MyColors.transparent,
        leading: Icon(icon, color: MyColors.primary),
        title: Text(name, style: br1, maxLines: 1,),
      ),
    );
  }

  Widget _drawerExpansionTile({
    required IconData icon,
    required String title,
    required bool isActive,
    required List<Widget> children,
  }) {
    return Material(
      color: isActive? MyColors.primaryLight : MyColors.transparent,
      child: ExpansionTile(
        leading: Icon(icon, color: MyColors.primary),
        title: Text(title, style: br1,maxLines: 1,),
        backgroundColor: MyColors.white,
        iconColor: MyColors.primary,
        shape: ContinuousRectangleBorder(),
        collapsedBackgroundColor: isActive? MyColors.primaryLight : MyColors.transparent,
        initiallyExpanded: isActive,
        children: children,
      ),
    );
  }

  void onTapIndex(ref, int index, String name) {
    ref.read(dashboardController.notifier).changeIndex(index, name);
  }
}

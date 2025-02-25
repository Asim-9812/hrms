import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/utils/router.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/font_manager.dart';
import '../../../../../../core/resources/gap_manager.dart';
import '../../../../../../core/widgets/common_widgets.dart';
import '../../../../../login/application/login_notifier.dart';
import '../../../../../policy/presentation/ui/policy.dart';
import '../../../../../profile/presentation/ui/profile.dart';
import '../../../../../settings/presentation/ui/settings.dart';
import '../../presentation.dart';

class DashboardDrawer extends ConsumerWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final pageName = ref.watch(dashboardController).activeIndexPage;
    final loginNotifier = ref.read(loginNotifierProvider.notifier);

    return Drawer(
      shape: ContinuousRectangleBorder(),
      width: 200,
      elevation: 0,
      child: Column(
        children: [
          SafeArea(child: DashboardLogo()),
          h20,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _drawerTiles(icon: Icons.dashboard, name: 'Dashboard', onTap: ()=>onTapIndex(context, Dashboard())),
                  _drawerTiles(icon: Icons.person, name: 'Profile', onTap: ()=>onTapIndex(context, Profile())),
                  _drawerTiles(icon: Icons.settings, name: 'Settings', onTap: ()=>onTapIndex(context, Settings())),
                  _drawerTiles(icon: Icons.policy, name: 'Policy', onTap: ()=>onTapIndex(context, Policy())),
                  _drawerTiles(icon: Icons.logout, name: 'Logout', onTap: () async {
                    await loginNotifier.logout().whenComplete((){

                      ref.refresh(loginNotifierProvider);
                    });
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //commit check

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


  void onTapIndex(BuildContext context, Widget widget)=> routeTo(context, widget);
}

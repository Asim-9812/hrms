


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hrm/src/core/utils/router.dart';
import 'package:hrm/src/features/login/presentation/ui/login_page.dart';
import 'package:hrm/src/features/settings/presentation/ui/settings.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/gap_manager.dart';
import '../../../../../biometrics_auth/domain/model/biometric_model.dart';
import '../../../../../login/application/login_notifier.dart';

class PopUpMenuWidget extends ConsumerWidget {
  const PopUpMenuWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final loginNotifier = ref.read(loginNotifierProvider.notifier);
    return PopupMenuButton(
        iconColor: MyColors.white,
        position: PopupMenuPosition.under,
        color: MyColors.white,
        itemBuilder: (context){
          return [
            _menuForm(icon: Icons.person, name: 'Profile'),
            _menuForm(icon: Icons.settings, name: 'Settings', onTap: ()=>routeTo(context, Settings())),
            _menuForm(icon: Icons.logout, name: 'Log out', onTap: () async {
              await loginNotifier.logout().whenComplete((){

                ref.refresh(loginNotifierProvider);
              });
            }),
          ];
        }
    );
  }

  PopupMenuItem _menuForm({required IconData icon, required String name, VoidCallback? onTap}){
    return PopupMenuItem(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon,color: MyColors.primary,size: 18,),
            w10,
            Text(name),
          ],
        )
    );
  }

}

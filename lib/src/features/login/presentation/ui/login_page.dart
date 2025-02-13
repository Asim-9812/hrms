
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/core/resources/color_manager.dart';
import 'package:hrm/src/features/login/presentation/ui/widgets/cred_container.dart';
import 'widgets/top_logo.dart';



class LoginPage extends ConsumerWidget {
  LoginPage({super.key});



  @override
  Widget build(BuildContext context, ref) {


    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: MyColors.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopLogo(),
            CredContainer()
          ],
        ),
      ),
    );
  }
}

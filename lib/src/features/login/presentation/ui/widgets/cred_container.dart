

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hrm/src/features/login/presentation/ui/widgets/cred_text_form_field.dart';

import '../../../../../core/resources/color_manager.dart';

class CredContainer extends StatelessWidget {
  const CredContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: FadeInUp(
        duration: Duration(seconds: 1),
        child: Container(
          decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(48))
          ),
          padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          child: SingleChildScrollView(
            child: CredTextFormField(),
          ),
        ),
      ),
    );
  }
}

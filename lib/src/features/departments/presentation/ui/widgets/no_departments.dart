
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm/src/features/departments/application/providers/department_providers.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../../../core/widgets/common_widgets.dart';

class NoDepartments extends ConsumerWidget {
  final String error;
  const NoDepartments({required this.error,super.key});

  @override
  Widget build(BuildContext context, ref) {
    return RefreshIndicator(
      onRefresh: (){
        ref.refresh(departmentProviders);
        return Future.value(true);
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NoItems(),
            h10,
            Text('No Departments',style: bh2,),
            h10,
            Text('Something went wrong.',style: br3,)
          ],
        ),
      ),
    );
  }
}

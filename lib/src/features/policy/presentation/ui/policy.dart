

import 'package:flutter/material.dart';
import 'package:hrm/src/core/resources/font_manager.dart';
import 'package:hrm/src/core/widgets/common_widgets.dart';

class Policy extends StatelessWidget {
  const Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonNavBar(name: 'Policy'),
      body: Center(child: Text('NO POLICY',style: bh1,),),
    );
  }
}

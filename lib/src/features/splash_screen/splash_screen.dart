

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hrm/src/core/utils/router.dart';
import 'package:hrm/src/features/login/status_page.dart';
import '../../core/resources/color_manager.dart';
import '../dashboard/presentation/ui/presentation.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Timer _timer;

  @override
  void initState(){
    
    _timer = Timer(Duration(seconds: 3), ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>StatusPage()), (route) => false,));
    
    super.initState();    
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: MyColors.primary,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/images/splash_overlay.png'),
          ),
          FadeIn(
            duration: Duration(seconds: 2),
            child: ZoomIn(
              duration: Duration(seconds: 1),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: MyColors.white,
                  radius: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      radius: 80,
                        backgroundColor: MyColors.white,
                        backgroundImage: AssetImage('assets/images/fav.jpg'),),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hrm/src/features/biometrics_auth/application/biometric_provider.dart';
import 'package:hrm/src/features/biometrics_auth/data/authenticate_services.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/gap_manager.dart';
import '../../../../biometrics_auth/data/biometric_state.dart';
import '../../../application/login_controller.dart';
import '../../../application/login_notifier.dart';

class CredTextFormField extends ConsumerWidget {
  const CredTextFormField({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final loginNotifier = ref.read(loginNotifierProvider.notifier);
    final loginState = ref.watch(loginNotifierProvider);
    final isObscure = ref.watch(loginController).isObscure;
    final remember = ref.watch(loginController).remember;
    final formKey = ref.watch(loginController).formKey;
    final codeController = ref.watch(loginController).codeController;
    final userController = ref.watch(loginController).usernameController;
    final pwController = ref.watch(loginController).passwordController;
    final isBiometricEnabled = ref.watch(biometricProvider);




    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          h10,
          Row(
            children: [
              Icon(Icons.person,color: MyColors.primary,size: 48,),
              w10,
              Text('Login',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w500),)
            ],
          ),
          h20,
          TextFormField(
            controller: codeController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: MyColors.grey
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: MyColors.grey
                    )
                ),
                labelText: 'Code',
                labelStyle: br2,
                prefixIcon: Icon(Icons.numbers,color: MyColors.primary,)
            ),
            validator: (val){
              if(val == null || val.trim().isEmpty){
                return 'Code is required';
              }
              return null;
            },
          ),
          h10,
          TextFormField(
            controller: userController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: MyColors.grey
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: MyColors.grey
                    )
                ),
                labelText: 'Username',
                labelStyle: br2,
                prefixIcon: Icon(Icons.mail,color: MyColors.primary,)
            ),
            validator: (val){
              if(val == null || val.trim().isEmpty){
                return 'Username is required';
              }
              return null;
            },
          ),
          h10,
          TextFormField(
            controller: pwController,
            obscureText: isObscure,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: MyColors.grey
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: MyColors.grey
                    )
                ),
                labelText: 'Password',
                labelStyle: br2,
                prefixIcon: Icon(Icons.key,color: MyColors.primary,),
                suffixIcon: IconButton(
                    onPressed: (){
                      ref.read(loginController.notifier).changeObscure();
                    },
                    icon: Icon(isObscure ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,color: MyColors.primary,)
                )
            ),
            validator: (val){
              if(val == null || val.trim().isEmpty){
                return 'Password is required';
              }
              return null;
            },
            onFieldSubmitted: (val) async {
              if(formKey.currentState!.validate()){
                final code = codeController.text.trim();
                final username = userController.text.trim();
                final password = pwController.text.trim();

                await loginNotifier.login(code: code, username: username, password: password);

              }
            },

          ),
          h20,
          Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: MyColors.primary,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      )
                  ),
                  onPressed: () async {
                    if(formKey.currentState!.validate()){
                      final code = codeController.text.trim();
                      final username = userController.text.trim();
                      final password = pwController.text.trim();

                      

                      await loginNotifier.login(code: code, username: username, password: password);

                    }
                  },
                  child: loginState.isLoading
                      ? const SpinKitDualRing(color: MyColors.white, size: 16,)
                      : const Text('Sign in',style: wh2,),
                ),
              ),
              if(isBiometricEnabled)
              w04,
              if(isBiometricEnabled)
              IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: MyColors.primary,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    )
                ),
                  onPressed: () async {
                  final biometricCred = ref.watch(biometricInfoProvider);
                  final isBioEnabled = await Authentication().authenticateWithBio();
                  if(isBioEnabled){
                    final code = biometricCred.code;
                    final username = biometricCred.username;
                    final password = biometricCred.password;



                    await loginNotifier.login(code: code!, username: username!, password: password!);
                  }

                  },
                  icon: Icon(Icons.fingerprint,color: MyColors.white,)
              )
            ],
          ),
          Center(
              child: TextButton(
                  onPressed: (){},
                  child: Text('Forgot password?')
              )
          )
        ],
      ),
    );
  }
}

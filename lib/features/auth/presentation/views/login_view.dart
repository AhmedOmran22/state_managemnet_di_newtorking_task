import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managemnet_di_newtorking_task/core/services/service_locator.dart';
import 'package:state_managemnet_di_newtorking_task/features/auth/presentation/cubits/login_cubit.dart';
import 'package:state_managemnet_di_newtorking_task/features/auth/presentation/widgets/login_form.dart';

import '../../../../core/utils/app_assets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get()),
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * .2),
              Image.asset(
                AppAssets.imagesLogin,
                width: width * .8,
                height: height * .3,
              ),
              const LoginForm(),
              SizedBox(height: height * .05),
            ],
          ),
        ),
      ),
    );
  }
}

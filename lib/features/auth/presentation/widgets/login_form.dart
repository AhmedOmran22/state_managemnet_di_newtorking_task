import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managemnet_di_newtorking_task/core/routes/app_routes.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_validations.dart';
import '../../../../core/utils/show_snack_bar_funnction.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/general_button.dart';
import '../../../../core/widgets/password_field.dart';
import '../../data/models/login_request_model.dart';
import '../cubits/login_cubit.dart';
import '../cubits/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController, passwordController;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            CustomTextFormField(
              controller: emailController,
              hintText: "Email",
              validator: (value) => AppValidations.validateEmail(value),
            ),
            PasswordField(
              controller: passwordController,
              hintText: "Password",
              validator: (value) => AppValidations.validatePassword(value),
            ),
            BlocConsumer<LoginCubit, LoginStates>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                }
                if (state is LoginFailure) {
                  showSnackBarFuction(context, state.errMessage);
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return GeneralButton(
                  text: "Login",
                  backgroundColor: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      _handleLogin();
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    context.read<LoginCubit>().login(
      loginRequestModel: LoginRequestModel(email: email, password: password),
    );
  }
}

import 'package:agriapp/data/data_source/local/preference_util/preference_utils.dart';
import 'package:agriapp/data/helper/widgets/utils.dart';
import 'package:agriapp/ui/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:go_router/go_router.dart';

import '../../../data/helper/barrel.dart';
import '../../../data/router/rounter_config.dart';
import '../../../domain/blocs/state_api/form_state.dart';
import '../../../domain/models/auth/login_response.dart';


class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  late TextEditingController emailController, passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController(text: "hirenp557@gmail.com");
    passwordController = TextEditingController(text: "4y71nKYpqNUl8B6kfoGA8^x)");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, FormStateApi>(
      listener: (context, state) {
        if (state.formLoadingState == FormLoadingState.loading) {
          Utils(context).startLoading();
        }
        if (state.formLoadingState != FormLoadingState.idle &&
            state.formLoadingState != FormLoadingState.loading) {
          Utils(context).stopLoading();
        }
        if (state.formLoadingState == FormLoadingState.success) {
          LoginResponse loginResponse = state.success;
          // PreferenceUtils.setString(PreferenceUtils.USERID, loginResponse?.message);
          context.pushReplacementNamed(RouterUtil.homeUi);
        }
        if (state.formLoadingState == FormLoadingState.failure) {
          var snackBar = SnackBar(
            content: Text(state.errorMessage ?? "Something went wrong!!"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return AuthScaffold(
          header: "Welcome Back!",
          btnText: "Log in",
          spanText: "Don't have an account?",
          spanBoldText: ' Register',
          onSpanTap: () => context.pushNamed(RouterUtil.registerUi),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                MyLabelTextField(
                  controller: emailController,
                  label: "Email Address",
                  hintText: "Enter your email address",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    // Add additional email validation logic if needed
                    return null;
                  },
                ),
                2.0.h.height(),
                MyLabelTextField(
                  controller: passwordController,
                  label: "Password",
                  hintText: "Enter your password",
                  passwordField: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Add additional password validation logic if needed
                    return null;
                  },
                ),
                TextButton(
                  onPressed: () {
                    context.pushNamed(RouterUtil.forgotPassword);
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: txtLatoBoldF14cPrimary,
                  ),
                ).right(),
                4.0.h.height(),
              ],
            ),
          ),
          onTap: () {
            if (_formKey.currentState!.validate()) {
              context.read<AuthCubit>().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/helper/barrel.dart';

import '../../../../data/helper/widgets/utils.dart';
import '../../../../domain/blocs/state_api/form_state.dart';
import '../../../../domain/blocs/auth_cubit/auth_cubit.dart';

class ForgotPasswordUi extends StatefulWidget {
  const ForgotPasswordUi({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordUi> createState() => _ForgotPasswordUiState();
}

class _ForgotPasswordUiState extends State<ForgotPasswordUi> {
  late TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
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
          var snackBar = SnackBar(
            content: Text(state.errorMessage ?? "Something went wrong!!"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          context.pop();
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
          header: "Forgot Password",
          btnText: "Send Code",
          spanText: "Back to",
          spanBoldText: " Log in",
          onSpanTap: () => context.pop(),
          onTap: () {
            if (_formKey.currentState!.validate()) {
              context
                  .read<AuthCubit>()
                  .forgotPassword(email: emailController.text);
            }
          },
          body: SingleChildScrollView(
            child: Form(
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
                  3.0.h.height(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

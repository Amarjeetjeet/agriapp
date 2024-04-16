import 'package:agriapp/domain/blocs/state_api/form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/helper/barrel.dart';
import '../../../../data/helper/widgets/utils.dart';
import '../../../../domain/models/auth/auth_model.dart';
import '../../../../domain/models/auth/login_response.dart';
import 'cubit/change_password_cubit.dart';

class ChangePasswordUi extends StatefulWidget {
  const ChangePasswordUi({Key? key}) : super(key: key);

  @override
  State<ChangePasswordUi> createState() => _ChangePasswordUiState();
}

class _ChangePasswordUiState extends State<ChangePasswordUi> {
  late TextEditingController _confirmPasswordController, _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Change password",
        ),
        body: BlocListener<ChangePasswordCubit, FormStateApi>(
          listener: (context, state) {
            if (state.formLoadingState == FormLoadingState.loading) {
              Utils(context).startLoading();
            }
            if (state.formLoadingState != FormLoadingState.idle &&
                state.formLoadingState != FormLoadingState.loading) {
              Utils(context).stopLoading();
            }
            if (state.formLoadingState == FormLoadingState.success) {
              AuthModel? response = state.success;
              var snackBar = SnackBar(
                content: Text(response?.message ?? "Password changed successfully!!"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              context.pop();
            }
            if (state.formLoadingState == FormLoadingState.failure) {
              var snackBar = SnackBar(
                content: Text(state.errorMessage ?? "Something went wrong!!"),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: BlocBuilder<ChangePasswordCubit, FormStateApi>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        MyLabelTextField(
                          label: "Password",
                          hintText: "Enter your password",
                          passwordField: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                        2.0.h.height(),
                        MyLabelTextField(
                          label: "Confirm Password",
                          hintText: "Enter your confirm password",
                          passwordField: true,
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter a password';
                            }
                            final password = _passwordController.text;
                            if (password != value) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        3.0.h.height(),
                        PrimaryButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              // Form is validated, proceed with your logic
                              // For example, you can access the entered values like this:
                              final password = _passwordController.text;
                              final confirmPassword =
                                  _confirmPasswordController.text;

                              context
                                  .read<ChangePasswordCubit>()
                                  .changePassword(password: password);
                            }
                          },
                          btnName: "Change password",
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// return AuthScaffold(
//   header: "New Password",
//   btnText: "Reset Password",
//   spanText: "Back to",
//   spanBoldText: " Log in",
//   onTap: () => context.pop(),
//   body: SingleChildScrollView(
//     child: Column(
//       children: [
//         const MyLabelTextField(
//           label: "Password",
//           hintText: "Enter your password",
//           passwordField: true,
//         ),
//         2.0.h.height(),
//         const MyLabelTextField(
//           label: "Confirm Password",
//           hintText: "Enter your confirm password",
//           passwordField: true,
//         ),
//         3.0.h.height(),
//       ],
//     ),
//   ),
// );

import 'package:agriapp/domain/blocs/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:go_router/go_router.dart';

import '../../../data/helper/barrel.dart';
import '../../../data/helper/widgets/utils.dart';
import '../../../domain/blocs/state_api/form_state.dart';
import '../../../domain/models/auth/register_input.dart';


class RegisterUi extends StatefulWidget {
  const RegisterUi({super.key});

  @override
  State<RegisterUi> createState() => _RegisterUiState();
}

class _RegisterUiState extends State<RegisterUi> {
  late TextEditingController usernameController,
      firstNameController,
      lastNameController,
      emailController,
      passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    usernameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
          header: "Register",
          btnText: "Register",
          spanText: "Already have an account?",
          spanBoldText: ' Log in',
          onSpanTap: () => context.pop(),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  MyLabelTextField(
                    controller: usernameController,
                    label: "Username",
                    hintText: "Enter your username",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      // Add additional validation logic if needed
                      return null;
                    },
                  ),
                  2.0.h.height(),
                  MyLabelTextField(
                    controller: firstNameController,
                    label: "Firstname",
                    hintText: "Enter your firstname",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your firstname';
                      }
                      // Add additional validation logic if needed
                      return null;
                    },
                  ),
                  2.0.h.height(),
                  MyLabelTextField(
                    controller: lastNameController,
                    label: "Lastname",
                    hintText: "Enter your lastname",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your lastname';
                      }
                      // Add additional validation logic if needed
                      return null;
                    },
                  ),
                  2.0.h.height(),
                  MyLabelTextField(
                    controller: emailController,
                    label: "Email Address",
                    hintText: "Enter your email address",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
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
                      // Add additional validation logic if needed
                      return null;
                    },
                  ),
                  6.0.h.height(),
                ],
              ),
            ),
          ),
          onTap: () {
            if (_formKey.currentState?.validate() ?? false) {
              RegisterInput registerInput = RegisterInput(
                username: usernameController.text,
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                email: emailController.text,
                password: passwordController.text,
              );
              context.read<AuthCubit>().register(registerInput: registerInput);
            }
          },
        );
      },
    );
  }
}

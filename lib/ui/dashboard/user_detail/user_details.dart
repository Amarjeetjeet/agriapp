import 'package:agriapp/data/helper/barrel.dart';
import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:agriapp/domain/blocs/user_detail_cubit/user_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/user_details/user_details.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late TextEditingController userName, displayName, emailAddress;

  @override
  void initState() {
    userName = TextEditingController();
    displayName = TextEditingController();
    emailAddress = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: "User detail"),
      body: BlocProvider(
        create: (context) => UserDetailCubit()..getUserDetails(),
        child: BlocConsumer<UserDetailCubit, StateApi>(
          listener: (context, state) {
            if (state is SuccessState) {
              UserDetailResponse? userDetailResponse = state.success;
              userName.text = userDetailResponse?.userDetail?.userName ?? "";
              displayName.text =
                  userDetailResponse?.userDetail?.displayName ?? "";
              emailAddress.text =
                  userDetailResponse?.userDetail?.userEmail ?? "";
            }
          },
          builder: (context, state) {
            return switch (state) {
              LoadingState() => const Loader(),
              SuccessState() => userProfile(state.success),
              FailureState() => DisplayError(
                  errorMessage: state.errorMessage,
                ),
              EmptyState() => const DisplayError(
                  errorMessage: "",
                ),
            };
          },
        ),
      ),
    );
  }

  Widget userProfile(UserDetailResponse? userDetailResponse) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 48,
              backgroundImage: AssetImage(user),
            ),
            32.0.height(),
            MyTextField(
              controller: userName,
              hintText: "hintText",
              readOnly: true,
            ),
            16.0.height(),
            MyTextField(
              controller: emailAddress,
              hintText: "hintText",
              readOnly: true,
            ),
            16.0.height(),
            MyTextField(
              controller: displayName,
              hintText: "hintText",
              readOnly: true,
            ),
            32.0.height(),
            PrimaryButton(onTap: () {}, btnName: "SAVE CHANGES"),
          ],
        ),
      ),
    );
  }
}

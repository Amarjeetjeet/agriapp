import 'package:agriapp/data/helper/barrel.dart';
import 'package:agriapp/domain/blocs/static_page_cubit/static_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/blocs/state_api/state_api.dart';

class TermAndConditionsPage extends StatelessWidget {
  const TermAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Term And Conditions',
      ),
      body: BlocProvider(
        create: (context) => StaticPageCubit()..getTermAndCondition(),
        child: BlocBuilder<StaticPageCubit, StateApi>(builder: (
          context,
          state,
        ) {
          return switch (state) {
            LoadingState() => const Loader(),
            SuccessState() => buildSuccessBody(state.success),
            FailureState() => DisplayError(errorMessage: state.errorMessage),
            EmptyState() => const EmptyList(),
          };
        }),
      ),
    );
  }

  Widget buildSuccessBody(Map<String, dynamic> state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              state["page_title"],
              style: txtMediumF14c383838,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              state["page_content"],
              style: txtMediumF14c383838,
            ),
          ],
        ),
      ),
    );
  }

  Row buildRow(String title, String content) {
    return Row(
      children: [
        Text(
          title,
          style: txtMediumF16c383838,
        ),
        Text(
          content,
          style: txtMediumF14c383838,
        ),
      ],
    );
  }
}

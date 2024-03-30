import 'package:agriapp/data/helper/barrel.dart';
import 'package:agriapp/ui/dashboard/home/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:go_router/go_router.dart';

import '../../../data/router/rounter_config.dart';
import '../../../domain/blocs/category_cubit/category_cubit.dart';
import '../../../domain/blocs/featured_product_cubit/featured_product_cubit.dart';
import 'widgets/category_list.dart';
import 'widgets/home_app_bar.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  final List<String> featuredProductCategoryList = ["96", "683", "714"];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HomeAppBar(
        onSuffixIconPress: (){
          context.pushNamed(RouterUtil.notificationUi);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              BlocProvider(
                create: (context) => CategoryCubit()..allCategory(),
                child: const CategoryList(),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: featuredProductCategoryList.length,
                itemBuilder: (context, index) {
                  return BlocProvider(
                    create: (context) => FeaturedProductCubit()
                      ..featuredProductList(
                        productCategoryId: featuredProductCategoryList[index],
                      ),
                    child: const ProductList(),
                  );
                },
              ),
              10.h.height(),
            ],
          ),
        ),
      ),
    );
  }
}

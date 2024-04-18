import 'package:agriapp/data/helper/barrel.dart';
import 'package:agriapp/ui/dashboard/home/widgets/home_drawer.dart';
import 'package:agriapp/ui/dashboard/home/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/router/rounter_config.dart';
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
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      key: _key,
      drawer: const HomeDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            automaticallyImplyLeading: false,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: HomeAppBar(
                onSuffixIconPress: () {
                  context.pushNamed(RouterUtil.notificationUi);
                },
                menu: Builder(builder: (context) {
                  return IconButton.outlined(
                    style: buildIconOutlineStyleFrom(),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: SvgHelper(
                      imagePath: menu,
                    ),
                  );
                }),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CategoryList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: featuredProductCategoryList.length,
                    itemBuilder: (context, index) {
                      return BlocProvider(
                        create: (context) => FeaturedProductCubit()
                          ..featuredProductList(
                            productCategoryId:
                                featuredProductCategoryList[index],
                          ),
                        child: const ProductList(),
                      );
                    },
                  ),
                ),
                10.0.height(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

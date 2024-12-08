import 'package:agriapp/domain/blocs/banner_and_brand_cubit/banner_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/blocs/state_api/state_api.dart';
import '../../../../domain/models/banner_and_brand/banner_list_response.dart';
import '../../category/category_wise_product/category_wise_products.dart';

class BannerListWidget extends StatefulWidget {
  const BannerListWidget({super.key});

  @override
  State<BannerListWidget> createState() => _BannerListWidgetState();
}

class _BannerListWidgetState extends State<BannerListWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerAndCompanyCubit, StateApi>(
      builder: (context, state) {
        if (state is SuccessState) {
          BannerListResponse bannerListResponse =
              state.success as BannerListResponse;
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 150.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  items: (bannerListResponse.bannerList?[0].slides ?? []).map(
                    (i) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => CategoryWiseProducts(
                                categoryId: int.tryParse(i.id ?? "0") ?? 0,
                                categoryName: i.endpoint ??
                                    "",
                              ),
                            ),
                          );
                        },
                        child: Image.network(
                          i.imageUrl ?? "",
                          errorBuilder: (___, __, _) {
                            return const Icon(Icons.error);
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: (bannerListResponse.bannerList?[0].slides ?? [])
                      .asMap()
                      .entries
                      .map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.only(top: 8.0, right: 8.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Theme.of(context).primaryColor)
                                .withOpacity(
                                    _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

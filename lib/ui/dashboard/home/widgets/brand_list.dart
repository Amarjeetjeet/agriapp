import 'package:agriapp/data/helper/barrel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/helper/constants/font_style.dart';
import '../../../../domain/blocs/banner_and_brand_cubit/brand_cubit.dart';
import '../../../../domain/blocs/state_api/state_api.dart';
import '../../../../domain/models/banner_and_brand/brand_list_response.dart';
import '../../category/category_wise_product/category_wise_products.dart';

class BrandListWidget extends StatefulWidget {
  const BrandListWidget({super.key});

  @override
  State<BrandListWidget> createState() => _BrandListWidgetState();
}

class _BrandListWidgetState extends State<BrandListWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, StateApi>(
      builder: (context, state) {
        if (state is SuccessState) {
          BrandListResponse brandListResponse =
              state.success as BrandListResponse;
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Brand",
                      style: txtMediumF20c383838,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 150.0,
                    viewportFraction: 0.3,
                    aspectRatio: 2.0,
                    initialPage: 2,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  items: (brandListResponse.brandList ?? []).map(
                    (i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CategoryWiseProducts(
                                categoryId: i.brandId ?? 0,
                                categoryName: i.brandName ?? "",
                              ),
                            ),
                          );
                        },
                        child: Image.network(
                          i.brandLogo ?? "",
                          errorBuilder: (___, __, _) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: primaryColor,
                                  width: 1,
                                )
                              ),
                              child: Center(
                                child: Text(
                                  i.brandName ?? "",
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  style: txtBoldF14cPrimary,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: LinearProgressIndicator(
                    minHeight: 1,
                    borderRadius: BorderRadius.circular(12),
                    value: (_current /
                        (brandListResponse.brandList?.length ?? 0).toDouble()),
                  ),
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

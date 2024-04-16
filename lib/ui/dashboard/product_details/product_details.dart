import 'package:agriapp/domain/blocs/cart_cubit/cart_cubit.dart';
import 'package:agriapp/domain/blocs/cart_cubit/cart_state.dart';
import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:agriapp/domain/models/product/product_detail.dart';
import 'package:agriapp/ui/dashboard/product_details/product_detail_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../data/helper/barrel.dart';
import '../../cart/ui/cart_ui.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productId});

  final int? productId;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context
          .read<CartItemCubit>()
          .getQuantity(productId: widget.productId ?? 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(
          () => context.read<CartItemCubit>().getQuantity(
        productId: widget.productId ?? 0,
      ),
    );
    return BlocProvider(
      create: (context) => ProductDetailCubit()
        ..getProductDetail(
          productId: widget.productId,
        ),
      child: AppScaffold(
        appBar: const CustomAppBar(
          title: "Product Details",
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 110,
          child: BlocBuilder<ProductDetailCubit, StateApi>(
            builder: (context, productState) {
              if (productState is SuccessState) {
                ProductDetail productDetail = productState.success;
                return BlocBuilder<CartItemCubit, CartState>(
                  builder: (context, counterState) {
                    return Row(
                      children: [
                        10.0.width(),
                        if (counterState.counter <= 0) ...[
                          Flexible(
                            child: SecondaryButton(
                              onTap: () {
                                BlocProvider.of<CartItemCubit>(context).addItem(
                                  productId:
                                      productDetail.productDetails?.productId ??
                                          0,
                                  productImage: productDetail.productDetails
                                          ?.productImageFeaturedImageLink?[0] ??
                                      "",
                                  productName: productDetail
                                          .productDetails?.productName ??
                                      "N/A",
                                  discountedPrice: productDetail
                                          .productDetails?.productPrice ??
                                      "0",
                                  regularPrice: productDetail.productDetails
                                          ?.productRegularPrice ??
                                      "0",
                                );
                              },
                              btnName: "Add To Cart",
                            ),
                          ),
                        ],
                        if (counterState.counter > 0) ...[
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundedIconBtn(
                                    iconData: Icons.remove,
                                    onTap: () {
                                      BlocProvider.of<CartItemCubit>(context)
                                          .decrementQuantity(
                                        widget.productId ?? 0,
                                      );
                                    }),
                                Text(
                                  counterState.counter.toString(),
                                  style: txtSemiBoldF24c383838,
                                ),
                                RoundedIconBtn(
                                  iconData: Icons.add,
                                  onTap: () {
                                    BlocProvider.of<CartItemCubit>(context)
                                        .incrementQuantity(
                                      widget.productId ?? 0,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                        10.0.width(),
                        Flexible(
                          child: PrimaryButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const CartUi(),
                                ),
                              );
                            },
                            btnName: "Go To Cart",
                          ),
                        ),
                        10.0.width(),
                      ],
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
        body: BlocBuilder<ProductDetailCubit, StateApi>(
          builder: (context, productDetailState) {
            return switch (productDetailState) {
              LoadingState() => const Loader(),
              FailureState() => DisplayError(
                  errorMessage: productDetailState.errorMessage,
                ),
              EmptyState() => const DisplayError(
                  errorMessage: "Empty details",
                ),
              SuccessState() => buildProductBody(productDetailState.success),
            };
          },
        ),
      ),
    );
  }

  SingleChildScrollView buildProductBody(ProductDetail? productDetail) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: (page, _) {
                  setState(() {
                    selectedIndex = page;
                  });
                },
              ),
              items: (productDetail?.productDetails?.featureImagesList ?? [])
                  .map((image) {
                debugPrint("The featureList is ${image}");

                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(
                      image ?? "",
                      fit: BoxFit.cover,
                    );
                  },
                );
              }).toList(),
            ),
            20.0.height(),
            Center(
              child: DotsIndicator(
                dotsCount:
                    (productDetail?.productDetails?.featureImagesList ?? [])
                        .length,
                position: selectedIndex,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(28.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            30.0.height(),
            Text(
              productDetail?.productDetails?.productName ?? "",
              style: txtMediumF18c38383,
            ),
            10.0.height(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OriginalPrice(
                  price: productDetail?.productDetails?.productRegularPrice,
                  font18: true,
                ),
                20.0.width(),
                DiscountPrice(
                  price: productDetail?.productDetails?.productPrice,
                  font18: true,
                ),
              ],
            ),
            25.0.height(),
            Text(
              "Description",
              style: txtMediumF18c38383,
            ),
            10.0.height(),
            Html(
                data: productDetail?.productDetails?.productDescription ?? " "),
          ],
        ),
      ),
    );
  }
}

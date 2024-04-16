import 'package:agriapp/domain/blocs/cart_cubit/cart_cubit.dart';
import 'package:agriapp/domain/blocs/state_api/state_api.dart';
import 'package:agriapp/domain/models/product/prodct_by_category_response.dart';
import 'package:agriapp/domain/models/product/product_detail.dart';
import 'package:agriapp/ui/dashboard/product_details/product_detail_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../data/helper/barrel.dart';
import '../../../domain/blocs/cart_cubit/cart_state.dart';
import '../../cart/ui/cart_ui.dart';

class ProductVariationDetails extends StatefulWidget {
  const ProductVariationDetails({super.key, required this.productId});

  final int? productId;

  @override
  State<ProductVariationDetails> createState() =>
      _ProductVariationDetailsState();
}

class _ProductVariationDetailsState extends State<ProductVariationDetails> {
  int selectedIndex = 0;

  String? productPrice;
  int? productID;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<CartItemCubit>().getQuantity(
            productId: productID ?? 0,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(
          () => context.read<CartItemCubit>().getQuantity(
        productId: productID ?? 0,
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
                                if (productPrice == null) {
                                  var snackBar = const SnackBar(
                                    content:
                                        Text("Please select quantity first!"),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  return;
                                }
                                BlocProvider.of<CartItemCubit>(context).addItem(
                                  productId: productID ?? 0,
                                  productImage: productDetail.productDetails
                                          ?.productImageFeaturedImageLink?[0] ??
                                      "",
                                  productName: productDetail
                                          .productDetails?.productName ??
                                      "N/A",
                                  discountedPrice: productPrice ?? "0",
                                  regularPrice: productDetail
                                          .productDetails?.productPrice ??
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
                                        productID ?? 0,
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
                                      productID ?? 0,
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
                viewportFraction: 1,
                onPageChanged: (page, _) {
                  setState(() {
                    selectedIndex = page;
                  });
                },
              ),
              items:
                  (productDetail?.productDetails?.productGalleryImageIds ?? [])
                      .map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(
                      productDetail?.productDetails
                              ?.productImageFeaturedImageLink?[0] ??
                          "",
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
                    (productDetail?.productDetails?.productGalleryImageIds ??
                            [])
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
            DiscountPrice(
              price: productPrice ??
                  "${productDetail?.productDetails?.variation?[0].productSalePrice} - "
                      "\u{20B9}${productDetail?.productDetails?.variation?.last.productSalePrice}",
              font18: true,
            ),
            10.0.height(),
            DropdownButtonFormField<Variation>(
              hint: const Text("Select options "),
              items: (productDetail?.productDetails?.variation ?? [])
                  .map((Variation items) {
                return DropdownMenuItem(
                  value: items,
                  child: Row(
                    children: [
                      Text(
                        items.productVariationAttributes?.attributePa10gm ?? "",
                        style: txtMediumF14c383838,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      DiscountPrice(
                        price: items.productSalePrice,
                      ),
                    ],
                  ),
                );
              }).toList(),
              validator: (value) {
                if ((productPrice ?? "").isEmpty) {
                  return "Select quantity first";
                }
              },
              onChanged: (Variation? newValue) {
                setState(() {
                  productPrice = (newValue?.productSalePrice ?? "");
                  productID = newValue?.productVariationId ?? 0;
                });
                context
                    .read<CartItemCubit>()
                    .getQuantity(productId: productID ?? 0);
              },
            ),
            25.0.height(),
            Text(
              "Description",
              style: txtMediumF18c38383,
            ),
            10.0.height(),
            Html(
              data: productDetail?.productDetails?.productDescription ?? " ",
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../data/helper/barrel.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productId});

  final int? productId;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedIndex = 0;

  int cartItem = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        suffixIcon: Icons.shopping_cart_outlined,
        title: "Product Details",
      ),
      bottomNavigationBar: cartBtns(),
      body: SingleChildScrollView(
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
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.asset(
                        product,
                        fit: BoxFit.cover,
                      );
                    },
                  );
                }).toList(),
              ),
              20.0.height(),
              Center(
                child: DotsIndicator(
                  dotsCount: [1, 2, 3, 4, 5].length,
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
                "Indo Us Black Gram Rajavi 11",
                style: txtMediumF18c38383,
              ),
              10.0.height(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const OriginalPrice(
                    price: "10000",
                    font18: true,
                  ),
                  20.0.width(),
                  const DiscountPrice(
                    price: "5999",
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
              Text(
                "Lorem Ipsum is simply dummy text of the printing"
                " and typesetting industry. Lorem Ipsum has been"
                " the industry's standard dummy text ever "
                "since the 1500s, when an unknown printer "
                "took a galley of type and scrambled it to "
                "make a type specimen book.",
                style: txtRegularF14c7C7C7C,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container cartBtns() {
    return Container(
      color: Colors.white,
      height: 110,
      child: Row(
        children: [
          10.0.width(),
          if (cartItem <= 0) ...[
            Flexible(
              child: SecondaryButton(
                onTap: () => setState(() {
                  cartItem++;
                }),
                btnName: "Add To Cart",
              ),
            ),
          ],
          if (cartItem > 0) ...[
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedIconBtn(
                    iconData: Icons.remove,
                    onTap: () => setState(() {
                      cartItem--;
                    }),
                  ),
                  Text(
                    cartItem.toString(),
                    style: txtSemiBoldF24c383838,
                  ),
                  RoundedIconBtn(
                    iconData: Icons.add,
                    onTap: () => setState(() {
                      cartItem++;
                    }),
                  ),
                ],
              ),
            ),
          ],
          10.0.width(),
          Flexible(
            child: PrimaryButton(
              onTap: () {},
              btnName: "Go To Cart",
            ),
          ),
          10.0.width(),
        ],
      ),
    );
  }
}


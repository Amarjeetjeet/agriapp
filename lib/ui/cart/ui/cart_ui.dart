import 'package:flutter/material.dart';

import '../../../data/helper/barrel.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/price_calculation.dart';

class CartUi extends StatelessWidget {
  const CartUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cScaffoldBg,
      appBar: const CustomAppBar(
        suffixIcon: Icons.notifications_none_sharp,
        title: 'Cart',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              20.0.height(),
              PrimaryIconButton(
                onTap: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                btnName: "Add New Address",
              ),
              10.0.height(),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildCard();
                  }),
              10.0.height(),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                  hintText: 'Promo code',
                  hintStyle: txtMediumF14c7C7C7C,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Apply",
                      style: txtSemiBoldF14Primary,
                    ),
                  ),
                ),
              ),
              10.0.height(),
              const PriceCalculation(
                totalPrice: 340.00,
                shippingCharges: 60.00,
                discountPrice: 100.00,
                netPrice: 200.00,
              ),
              10.0.height(),
              PrimaryButton(
                onTap: () {},
                btnName: "Place Order",
              ),
              10.0.height(),
              SecondaryButton(
                onTap: () {},
                btnName: "Continue Shopping",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard() {
    return CartItemCard(
      widget: Container(
        color: primaryColor.withOpacity(.08),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          children: [
            const RoundedIconBtn(
              iconData: Icons.remove,
            ),
            8.0.height(),
            Text(
              "2",
              style: txtMediumF14c383838,
            ),
            8.0.height(),
            const RoundedIconBtn(
              iconData: Icons.add,
            ),
          ],
        ),
      ),
    );
  }
}

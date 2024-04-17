import 'package:equatable/equatable.dart';

import '../../models/cart/cart_item.dart';

class CartState extends Equatable {
  final List<CartItems> cartItems;
  final int counter;

  const CartState({
    this.cartItems = const <CartItems>[],
    this.counter = 0,
  });

  CartState copyWith({List<CartItems>? cartItems, int? counter}) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object?> get props => [cartItems, counter];
}

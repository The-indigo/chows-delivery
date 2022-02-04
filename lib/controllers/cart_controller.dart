import 'package:chowsdelivery/models/cart_model.dart';
import 'package:chowsdelivery/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartNotifier extends ChangeNotifier {
  final Ref _ref;
  CartNotifier(this._ref);

  Future<void> addToCart(Cart item) async {
    try {
      final addToCart = await _ref.read(cartRepository).addToCart(item);
      print("addtocart returns $addToCart");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> increaseItemQuantity(String id) async {
    try {
      await _ref.read(cartRepository).increaseQuantity(id);
    } catch (e) {
      print("Error is $e");
    }
  }

  Future<void> decreaseItemQuantity(String id) async {
    try {
      await _ref.read(cartRepository).decreaseQuantity(id);
    } catch (e) {
      print("Error is $e");
    }
  }
}

import 'package:chowsdelivery/models/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartRepository {
  final firestore = FirebaseFirestore.instance;

  Stream<List<Cart>> getUserCartItems(String id) {
    var cartCollection = firestore.collection('cart');
    return cartCollection
        .where('userId', isEqualTo: id)
        .snapshots()
        .map((event) => event.docs.map((e) => Cart.fromJson(e.data())).toList());
  }

  addToCart(Cart item) async {
    final cartCollection = firestore.collection('cart');
    final documentId = cartCollection.doc();
    item.id = documentId.id;
    final cartObject = item.toJson();
    await documentId.set(cartObject);
  }

  Future<void> increaseQuantity(String id) async {
    final cartCollection = firestore.collection('cart');
    var cartD = await cartCollection.doc(id).get();
    // var cartItem = Cart.fromJson(cartDoc.data()!);
    // print(cartItem.amount);
    var cartDoc = cartCollection.doc(id);
    await cartDoc.update({"quantity": FieldValue.increment(1)});
  }

  Future<void> decreaseQuantity(String id) async {
    final cartCollection = firestore.collection('cart');
    //var cartD = await cartCollection.doc(id).get();
    // var cartItem = Cart.fromJson(cartDoc.data()!);
    // print(cartItem.amount);
    var cartDoc = cartCollection.doc(id);
    await cartDoc.update({"quantity": FieldValue.increment(-1)});
  }
}

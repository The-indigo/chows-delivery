import 'package:chowsdelivery/providers/providers.dart';
import 'package:chowsdelivery/sharedwidgets/button.dart';
import 'package:chowsdelivery/ui/cart/widgets/cart_details.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartStreamProvider);
    final cartNotifier = ref.watch(cartProvider);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: <Widget>[
            Text("Your Cart", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0)),
            SizedBox(height: 30.0),
            cart.when(
              data: (cartItem) {
                print(cartItem);
                return Expanded(
                    child: cartItem.isEmpty
                        ? Center(child: Text("You have no item in your cart yet"))
                        : Column(
                            children: <Widget>[
                              Expanded(
                                child: ListView.builder(
                                    itemCount: cartItem.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 20.0),
                                        child: CartDetails(
                                            id: cartItem[index].id!,
                                            quantity: cartItem[index].quantity,
                                            originalAmount: cartItem[index].amount,
                                            itemName: cartItem[index].name!,
                                            image: AssetImage(
                                              cartItem[index].imagePath!,
                                            ),
                                            increase: () async {
                                              await cartNotifier.increaseItemQuantity(cartItem[index].id!);
                                              //ref.read(cartNotifier).increaseItemQuantity(cartItem[index].id!);
                                            },
                                            decrease: () async {
                                              await cartNotifier.decreaseItemQuantity(cartItem[index].id!);
                                            },
                                            itemTotal: cartItem[index].total,
                                            // changeTotal: cartItem[index].oneItemTotal,
                                            remove: () {}),
                                      );
                                    }),
                              ),
                              Text("Total : 0 ", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0)),
                              SizedBox(height: 10.0),
                              Buttons(text: "Pay", pressed: () {})
                            ],
                          ));
              },
              error: (err, stacktrace) => Center(child: Text("An error occured.")),
              loading: () => Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[200]!,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) => Card(
                          elevation: 1.0,
                          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 28.0),
                            child: const SizedBox(height: 80),
                          ))),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class Snackbar extends StatelessWidget {
  const Snackbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
    );
  }
}

import 'package:chowsdelivery/models/cart_model.dart';
import 'package:chowsdelivery/models/product_model.dart';
import 'package:chowsdelivery/providers/providers.dart';
import 'package:chowsdelivery/ui/home/widgets/foodcategory.dart';
import 'package:chowsdelivery/ui/home/widgets/homescreentoprow.dart';
import 'package:chowsdelivery/ui/home/widgets/itemdetails.dart';
import 'package:chowsdelivery/ui/home/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Product>> products = ref.watch(productProvider);
    print("product from home is $products");
    final productNotifier = ref.watch(productProvider.notifier);
    final cart = ref.watch(cartProvider);
    final userProfile = ref.watch(profileScreenProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              HomeScreenTopRow(),
              SizedBox(
                height: 20.0,
              ),
              products.when(
                  error: (error, stack) =>
                      Center(child: Text("An error occured but don't fret. We are in this together")),
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
                  data: (product) {
                    // print("product is $product");
                    return Expanded(
                      child: Column(children: <Widget>[
                        Search(onChanged: (String value) async {
                          productNotifier.search(value);
                          // var productState = ref.watch(productProvider.notifier);
                          // productState.state.value!
                          //     .where((element) => element.name!.toLowerCase().contains(value.toLowerCase()))
                          //     .toList();
                        }),
                        SizedBox(
                          height: 15.0,
                        ),
                        FoodCategory(),
                        SizedBox(height: 10.0),
                        product.isEmpty
                            ? Center(
                                child: Text(
                                "Looks like your search returned no result.Don't fret we'll find it together",
                                textAlign: TextAlign.center,
                              ))
                            : Row(
                                children: <Widget>[
                                  Spacer(),
                                  GestureDetector(
                                    child: Text(
                                      'View all',
                                      style: TextStyle(
                                          color: Colors.orangeAccent, fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                        SizedBox(height: 15.0),
                        Expanded(
                          child: ListView.builder(
                              itemCount: product.length,
                              itemBuilder: (context, index) => Container(
                                  margin: EdgeInsets.only(bottom: 7.0),
                                  child: ItemDetails(
                                    id: product[index].id,
                                    category: product[index].category,
                                    imagePath: product[index].imagePath,
                                    name: product[index].name,
                                    amount: product[index].amount,
                                    clicked: () async {
                                      await cart.addToCart(Cart(
                                        userId: userProfile.uuid,
                                        amount: product[index].amount,
                                        imagePath: product[index].imagePath,
                                        name: product[index].name,
                                        quantity: 1,
                                        total: product[index].amount,
                                      ));
                                    },
                                  ))),
                        )
                      ]),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epsi_shop/product_model.dart';

import 'cart_model.dart';
import 'listview_products.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Panier Epsi Shop")),
      body: Center(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
              Text("Votre panier contient ${context.watch<CartModel>().getCount()} élément(s)", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6,),
                Consumer<CartModel>(
                    builder: (_,cart,__) => Expanded(
                      child: ListView.builder(itemCount: cart.getProducts().length,
                          itemBuilder: (_,index) {
                        final product = cart.getProducts()[index];
                        return ListTile(
                          leading: Image.network(product.image,width:55,height: 55,),
                          title: Text(product.nom),
                          subtitle: Text(product.displayPriceInEuro()),
                          trailing: IconButton(
                            onPressed: ()=> cart.remove(product),
                            icon: const Icon(Icons.delete)
                          ),
                        );
                      }
                      ),
                    ),
                ),
              Spacer(),
              Text("Votre panier total est de : ${context.watch<CartModel>().totalPrice()} €", style: Theme.of(context).textTheme.headline6,)
            ],
            ),
          ),
        ),
      );
  }
}

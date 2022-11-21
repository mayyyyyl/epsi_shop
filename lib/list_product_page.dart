import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'product_model.dart';
import 'package:http/http.dart' as http;
import 'listview_products.dart';
import 'package:epsi_shop/cart_model.dart';


class ListProductPage extends StatelessWidget {
  ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Liste des produits"),
            actions: [
              Stack(
                children: [
                  IconButton(onPressed: () {
                    context.go('/cart');
                  }, icon: const Icon(Icons.shopping_cart)),
                  Positioned(
                    right: 8,
                      top: 4,
                      child: Container(width: 18, height: 18, decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red),
                          child:Align(
                              alignment: Alignment.center,
                              child:
                              Text(
                                "${context.watch<CartModel>().getCount()}",
                                style: TextStyle(color: Colors.white),)
                      )
                ),
              ),
            ],
              )
            ],
        ),
      body: FutureBuilder<http.Response>(
          future: http.get(Uri.parse("https://fakestoreapi.com/products")),
          builder: (context, snapshot){
            if(snapshot.hasData && snapshot.data != null){
              List<dynamic> lsJsonProducts = jsonDecode(snapshot.data!.body);
              List<Product> _lsProducts = lsJsonProducts.map((element)
              => Product.fromJson(element)
              ).toList();
              return ListViewProducts(listProducts: _lsProducts,);
            }else if (snapshot.hasError){
              return Text(snapshot.data?.body ?? "Impossible de récup l'info: (");
            }else if (snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }else return Container();
        })
    );
  }
}

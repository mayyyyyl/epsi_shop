import 'package:epsi_shop/product_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage(this.product,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(product.nom),),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                height: 180,
                child: Hero(
                  tag: product.nom,
                  child: Image.network(product.image),
                ),
              ),
              Text(product.nom, style: Theme.of(context).textTheme.headline6),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                child: Text("Description", style: Theme.of(context).textTheme.headline5)
                ),
              Text(product.description),
              Padding(padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Nombre d'avis : ${product.displayNumberVote()}",
                          style: const TextStyle(decoration: TextDecoration.underline)
                      ),
                      GFRating(
                        color: GFColors.LIGHT,
                        borderColor: GFColors.LIGHT,
                        filledIcon: const Icon(
                          Icons.star,
                          color: GFColors.WARNING,
                        ),
                        size: GFSize.SMALL,
                        allowHalfRating: true,
                        value: product.note.toDouble(),
                        halfFilledIcon: const Icon(Icons.star_half, color: GFColors.WARNING,),
                        onChanged: (value) {
                        },
                      ),
                    ],
                  )
              ),
              Padding(padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.displayPriceInEuro(),
                  style: Theme.of(context).textTheme.headline4 ?.copyWith(color: Colors.red),),
                  ElevatedButton(onPressed: () {}, child: Text("Acheter".toUpperCase()),)
                ],),
              )
            ],
          )
    );
  }
}
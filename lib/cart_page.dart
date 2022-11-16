import 'package:flutter/material.dart';

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
              Text("Votre panier contient 1 élément", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6,),
              Row(children: [
                Image.network("https://asia.olympus-imaging.com/content/000107506.jpg", width: 80,height: 80 ,),
                Text("Titre de mon article"),
                Icon(Icons.delete)
              ],
              ),
              Spacer(),
              Text("Votre panier total est de : 22.0", style: Theme.of(context).textTheme.headline6,)
            ],
            ),
          ),
        ),
      );
  }
}

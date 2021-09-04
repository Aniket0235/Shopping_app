import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/Product_provider.dart';
import 'package:shop_app/Screens/edit_product_screen.dart';
import 'package:shop_app/widgets/User_product_item.dart';
import 'package:shop_app/widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    TextButton(onPressed: () {}, child: Text('No'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, i) => Column(
            children: <Widget>[
              UserProductItem(
                  productsData.items[i].title, productsData.items[i].image,productsData.items[i].id),
              Divider()
            ],
          ),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}

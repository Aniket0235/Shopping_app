import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/Product_provider.dart';
import 'package:shop_app/Screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;

  UserProductItem(this.title, this.image, this.id,  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
            }, icon: Icon(Icons.edit)),
            IconButton(
              onPressed: () {
                Provider.of<Products>(context,listen: false).deleteProduct(id);
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/Product_provider.dart';
import 'package:shop_app/Providers/cart.dart';
import 'package:shop_app/Screens/cart_screen.dart';
import 'package:shop_app/Screens/product_overview_screen.dart';
import 'package:shop_app/widgets/categories.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatefulWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  var _showOnlyFavorites = false;
  bool isSearching = true;
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        widget.showFavs ? productsData.favoriteItems : productsData.items;
    return Scaffold(
      appBar: AppBar(
          title: isSearching
              ? Text('Welcome '+'User',
                  style: TextStyle(fontSize: 22,
                      color: Colors.black, fontWeight: FontWeight.bold))
              : TextField(
                  decoration: InputDecoration(
                      hintText: "Search here",
                      ),
                ),
          backgroundColor: Colors.white,
          leading:
          isSearching? IconButton(
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
            icon: Icon(Icons.search),
            color: Colors.black,
          ):IconButton(
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
            icon: Icon(Icons.cancel),
            color: Colors.black,
          ),
          elevation: 0,
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (FilterOption selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOption.Favorites) {
                      _showOnlyFavorites = true;
                    } else {
                      _showOnlyFavorites = false;
                    }
                  });
                },
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: FilterOption.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text('Show All'),
                        value: FilterOption.All,
                      ),
                    ]),
            Consumer<Cart>(
                builder: (context, value, ch) => Badge(
                      position: BadgePosition.topEnd(top: 0, end: 3),
                      animationDuration: Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        value.itemCount.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      child: IconButton(
                          icon: Icon(Icons.shopping_cart),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(CartScreen.routeName);
                          }),
                    )),
          ]),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Our Products",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Categories(),
            SizedBox(
              height: 16,
            ),
            Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, i) => ChangeNotifierProvider.value(
                        value: products[i], child: ProductItem())))
          ]),
    );
  }
}

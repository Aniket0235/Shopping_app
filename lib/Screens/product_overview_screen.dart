import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/Product_provider.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:shop_app/widgets/products_grid.dart';
import 'orders_screen.dart';
import 'user_products.dart';

enum FilterOption {
  Favorites,
  All,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchSetProducts().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: buildBottomNavigationBar(),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : selectScreen());
  }

  Widget selectScreen() {
    switch (index) {
      case 1:
        return OrdersScreen();
      case 2:
        return UserProductsScreen();
      default:
        return ProductsGrid(_showOnlyFavorites);
    }
  }

  Widget buildBottomNavigationBar() {
    final inactiveColor = Colors.grey;
    return BottomNavyBar(
        selectedIndex: index,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text("Home"),
              textAlign: TextAlign.center,
              activeColor: Colors.green,
              inactiveColor: inactiveColor),
          // BottomNavyBarItem(
          //   icon: Icon(Icons.shop),
          //     title: Text('Shop'),
          //     textAlign: TextAlign.center,
          //     activeColor: Colors.deepOrange,
          //     inactiveColor: inactiveColor),
          BottomNavyBarItem(
              icon: Icon(Icons.payment),
              title: Text('Orders'),
              textAlign: TextAlign.center,
              activeColor: Colors.redAccent,
              inactiveColor: inactiveColor),
          BottomNavyBarItem(
              icon: Icon(Icons.edit),
              title: Text('Manage Products'),
              textAlign: TextAlign.center,
              activeColor: Colors.blueAccent,
              inactiveColor: inactiveColor),
        ],
        onItemSelected: (index) => setState(() => this.index = index));
  }
}

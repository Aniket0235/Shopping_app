import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/orders.dart';
import 'package:shop_app/Screens/cart_screen.dart';
import 'package:shop_app/Screens/edit_product_screen.dart';
import 'package:shop_app/Screens/orders_screen.dart';
import 'package:shop_app/Screens/user_products.dart';
import 'Providers/cart.dart';
import 'Screens/product_overview_screen.dart';
import 'package:shop_app/Screens/product_overview_screen.dart';
import 'package:shop_app/Screens/product_details_scteen.dart';
import 'Providers/Product_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'Shopping APP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.yellow,
        ),
        home: HomePage(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          UserProductsScreen.routeName: (context) => UserProductsScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
        },
      ),
    );
  }
}

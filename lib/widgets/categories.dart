import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
          itemBuilder: (context, index) => Padd(index),),
    );
  }
  Widget Padd(int index) { 
    return Container(
                  child: InputChip(
                    elevation: 2,
                    label:Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(categories[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20),
                    labelStyle: TextStyle(
                        fontFamily: "Whitney", fontWeight: FontWeight.w500),
                    backgroundColor: Colors.blueGrey[70],
                    // selected: index,
                    // selectedColor: Colors.yellow[200],
                    onPressed:(){}
                     ));
    }
  // Widget Padd(int index) { 
  //   return Container(
  //     child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
  //     child:
  //     Text(categories[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
  //   );}
}
 
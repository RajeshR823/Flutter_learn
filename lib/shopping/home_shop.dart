import 'package:flutter/material.dart';
import 'package:my_second_app/shopping/cart_provider.dart';
import 'package:my_second_app/shopping/product_list.dart';
import 'package:my_second_app/shopping/cart_page.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters= const ['All','Nike','Adidas','bata']; 
  late String selectedFilter;
  int currentPage = 0;

  final List<Widget> pages = const [ProductList(),CartPage()];
  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:IndexedStack(
      index: currentPage,
      children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        currentIndex:currentPage ,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart ),
              label: 'Cart'
              ),
 
        ],
        
         ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_second_app/shopping/global_shop_variable.dart';
import 'package:my_second_app/shopping/product_cart.dart';
import 'package:my_second_app/shopping/product_detail_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductList> {
  final List<String> filters= const ['All','Nike','Adidas','bata']; 
  late String selectedFilter;
  int currentPage = 0;
  

  
  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.sizeOf(context);
      const border = OutlineInputBorder(
                        borderSide: BorderSide(
                        color: Color.fromRGBO(225, 225, 225, 1),
                          ),
                        borderRadius: BorderRadius.horizontal(left:Radius.circular(50)),
                        );
    return SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                 Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
               const  Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border:border,
                      focusedBorder: border 

                      ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              
              child: ListView.builder(
                    itemCount: filters.length ,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) {
                      final filter= filters[index];
                       return Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 8),
                         child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = filter;
                            });
                            
                          },
                           child: Chip(
                            backgroundColor: selectedFilter == filter ? Theme.of(context).colorScheme.primary: const Color.fromRGBO(245, 247, 249, 1),
                            side: BorderSide(
                               color: const Color.fromRGBO(245, 247, 249, 1)
                            ),
                            label:Text(filter),
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 18,vertical: 13),
                            labelStyle: TextStyle(
                              fontSize: 16, 
                            ),
                            
                           ),
                         ),
                       );
                    },
              
                  ),
            ),

            Expanded(
              child: size.width > 600 ? 
              GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2

                  ), 
                itemBuilder: (context,index){
                  final product = products[index];
                    return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                          return ProductInformation(product: product);

                         }
                        ),
                      );
                    },
                    child: ProductCart(
                    title:product['title'] as String,
                    price:product['price'] as double,
                    image:product['imageUrl'] as String,
                    backgroundColor: index.isEven ?  const Color.fromRGBO(158, 209, 220, 1):const Color.fromARGB(255, 126, 147, 160),
                    ),
                  );

                },
                ):
              ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                          return ProductInformation(product: product);

                         }
                        ),
                      );
                    },
                    child: ProductCart(
                    title:product['title'] as String,
                    price:product['price'] as double,
                    image:product['imageUrl'] as String,
                    backgroundColor: index.isEven ?  const Color.fromRGBO(158, 209, 220, 1):const Color.fromARGB(255, 126, 147, 160),
                    ),
                  );
              },
              ),
            ),
                 
          ],
        ),
      );
  }
}
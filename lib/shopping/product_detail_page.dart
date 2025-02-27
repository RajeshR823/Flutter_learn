import 'package:flutter/material.dart';
import 'package:my_second_app/shopping/cart_provider.dart';
import 'package:my_second_app/shopping/global_shop_variable.dart';
import 'package:provider/provider.dart';

class ProductInformation extends StatefulWidget {
  final Map<String,Object> product ;
  
  const ProductInformation({
    super.key,
    required this.product
    });

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  int selectedSize = 0; 

  void onTab (){
    if(selectedSize != 0){
          Provider.of<CartProvider>(context,listen: false)
    .addProduct({
      'id':widget.product['id'],
      'title': widget.product['title'],
      'price': widget.product['price'],
      'imageUrl': widget.product['imageUrl'],
      'company': widget.product['company'],
      'sizes': selectedSize,

    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product Added Successfully'),),
    );
  
      
     }else{
        ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Select size first'),),
      );
     }

  }

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Details'),
       ),
       body: Center(
         child: Column(
          children: [
            Text(widget.product['title'] as String, style: Theme.of(context).textTheme.titleLarge,),

            const Spacer(

              //flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(widget.product['imageUrl'] as String,
              height: 250,),
            ),
            const Spacer(
              flex: 2,
            ),

            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245,247 ,249, 1),
                borderRadius: BorderRadius.circular(40)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,

                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 50,
                    
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:(widget.product['sizes'] as List<int>).length ,
                      itemBuilder: (context,index){
                        final size = (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                              

                            },
                            child: Chip(
                              label: Text(size.toString()),
                              backgroundColor: selectedSize == size ? Colors.amber :null ,
                              
                              ),
                          ),
                        );
                    
                    
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                     child: ElevatedButton.icon(
                      onPressed:onTab,
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                       ),
                      icon: const Icon(Icons.shopping_cart, color: Colors.black),
                      label: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,),
                        ),
                      ),
                 ),

                ],
              ),
              
            ), 
         
          ],
         ),
       ),
    );
  }
}
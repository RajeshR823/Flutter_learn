import 'package:flutter/material.dart';

class ProductInformation extends StatelessWidget {
  final Map<String,Object> product ;
  const ProductInformation({
    super.key,
    required this.product
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Details'),
       ),
       body: Center(
         child: Column(
          children: [
            Text(product['title'] as String, style: Theme.of(context).textTheme.titleLarge,),

            const Spacer(

              //flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(product['imageUrl'] as String),
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
                children: [
                  Text('\$${product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,

                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 50,
                    
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:(product['sizes'] as List<int>).length ,
                      itemBuilder: (context,index){
                        final size = (product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            label: Text(size.toString()),
                            
                            ),
                        );
                    
                    
                      }
                    ),
                  )

                ],
              ),
              
            ), 
         
          ],
         ),
       ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_second_app/shopping/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
   // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: TextStyle(fontSize: 24),),
        centerTitle: true,
      ),
      body:  ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context,index){
          final cartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 30,
            ),
            trailing: IconButton(onPressed: (){
              showDialog(
                // barrierDismissible: false,
                context:context , 
                builder: (context) {
            
                return AlertDialog(
                  title: Text('Delete'),
                  content: Text('Are you sure?'),
                  actions: [
                    TextButton(onPressed: 
                    (){
                      Navigator.of(context).pop();

                    }, child:const Text('No')),
                    TextButton(onPressed: (){
                        context.read<CartProvider>().removeProduct(cartItem);
                      // Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                       Navigator.of(context).pop();
                    }, child: const Text('Yes')),
                  ],

                );
              });
            }, icon: Icon(Icons.delete),color: Colors.red,),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,

            ),
            subtitle: Text('Size:${cartItem['sizes']}'),
            


          );
        }
      )
      
    ) ;
  }
}
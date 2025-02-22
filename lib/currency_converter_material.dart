import 'package:flutter/material.dart';

class CurrencyConverterMaterial extends StatelessWidget{
    const CurrencyConverterMaterial({super.key});

 @override
  Widget build(BuildContext context) { 

      return const Scaffold(
        backgroundColor: Colors.blueGrey,
        body:Center(
         child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
              "Hello there",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 248, 248, 248), 
               ),
              ),
              TextField(
                style: TextStyle(
                  color: Colors.amberAccent,
                ),
                decoration: InputDecoration(
                    hintText: 'Enter Here whatever you want',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    // prefixText:'hello', 
                    prefix: Icon(Icons.insert_emoticon),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder:OutlineInputBorder(
                      
                  )
                ),
              ),
          ],
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';

class CurrencyConverterMaterial extends StatelessWidget{
    const CurrencyConverterMaterial({super.key});

 @override
  Widget build(BuildContext context) { 
      final border =  OutlineInputBorder(
                      borderSide: BorderSide(
                        // color: Colors.red,
                        width: 3.0,
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignOutside,

                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),

                    );
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 222, 215),
        body:Center(
         child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Text(
              "Hello",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0), 
                 
               ),
              ),
              
              Padding(
                padding:const EdgeInsets.all(10),
            
                child: TextField(
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  decoration: InputDecoration(
                      hintText: 'Enter Here whatever you want',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      // prefixText:'hello', 
                      // prefix: const Icon(Icons.insert_emoticon),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: border,
                      enabledBorder: border,
                   
                
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,



                  
                  ),
                ),
              ),

             TextButton(onPressed: () {
              print("Click here");
             }, 
             child: 
              const Text('Click Here'),
             )


          ],
        ),
      )
      
    );
  }
}
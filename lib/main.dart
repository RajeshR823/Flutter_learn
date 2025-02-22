
import 'package:flutter/material.dart';
import 'package:my_second_app/currency_converter_material.dart';

void main(){
  runApp(const myApp());
}
class myApp extends StatelessWidget{
  const myApp ({super.key}); //key helps Flutter identify widgets uniquely in the widget tree for efficient updates.
  @override
  Widget build(BuildContext context) {
  ///A handle to the location of a widget in the widget tree.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:CurrencyConverterMaterial(),
     
    );
  }
}














///------------------------------------------------------
///widget tree
/// Metarial
/// |
/// |
/// ____ Scaffold
///           |
///           |
///           ____ center 
///                    |
///                    |__ Text
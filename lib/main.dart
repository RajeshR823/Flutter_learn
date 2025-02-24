
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_second_app/cupertino_currency_converter.dart';
import 'package:my_second_app/currency_converter_material.dart';

void main(){
  runApp(const MyCupertinoApp());
}
class myApp extends StatelessWidget{
  const myApp ({super.key}); //key helps Flutter identify widgets uniquely in the widget tree for efficient updates.
  @override
  Widget build(BuildContext context) {
  ///A handle to the location of a widget in the widget tree.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:CurrencyConverterMaterialPage(),
      
     
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    
     return const  CupertinoApp(
      debugShowCheckedModeBanner: false,
      home:CupertinoCurrencyConverter(),
      
     
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
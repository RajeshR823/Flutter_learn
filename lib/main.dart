
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_second_app/cupertino_currency_converter.dart';
import 'package:my_second_app/currency_converter_material.dart';
import 'package:my_second_app/wather_screen.dart';

void main(){
  runApp(const MyApp());
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home:  WeatherScreen() ,

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
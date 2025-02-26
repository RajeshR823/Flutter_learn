
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_second_app/shopping/home_shop.dart';
import 'package:my_second_app/cupertino_currency_converter.dart';
import 'package:my_second_app/currency_converter_material.dart';
import 'package:my_second_app/wather_screen.dart';
import 'package:my_second_app/shopping/product_detail_page.dart';

void main(){
  runApp(const ShoppingApp());
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


class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(254, 206, 1, 1),primary:const Color.fromRGBO(254, 206, 1, 1) ),
        inputDecorationTheme:const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight:FontWeight.bold,
            fontSize: 16,
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1), 

         
        ),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
             fontWeight: FontWeight.bold,
              fontSize: 16,
          )
        )
          
      ),
      
      home: ProductInformation(),
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_second_app/REST%20API/Todo_with_api/todo_list.dart';
import 'package:my_second_app/Storage/secured_storage.dart';
import 'package:my_second_app/Storage/shared_prefrence.dart';
import 'package:my_second_app/currency_converter/cupertino_currency_converter.dart';
import 'package:my_second_app/currency_converter/currency_converter_material.dart';
import 'package:my_second_app/shopping/cart_provider.dart';
import 'package:my_second_app/shopping/home_shop.dart';
import 'package:my_second_app/weather/wather_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_second_app/REST%20API/Simple%20JsonPlaceholder/post_screen.dart';


void main(){
  runApp( ToDo());
}



///---------------------------Currency Converter  Learning----------------------------------

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

///---------------------------Cupertino Learning----------------------------------

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

///---------------------------Weather App with api learning----------------------------------
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



///---------------------------shopping app ----------------------------------

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( ///store data
      create: (context) =>CartProvider(),
      child: MaterialApp(
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
            titleLarge: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      ),
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            
            bodySmall: TextStyle(
               fontWeight: FontWeight.bold,
                fontSize: 16,
            ),
      
           
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          useMaterial3: true
        ),
        
        home: HomePage(),
        ),

    );
  }
}


///---------------------------Shared Prefrence ----------------------------------

class Storing extends StatelessWidget {
  const Storing({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomeStorePage(),
    );
  }
}



///---------------------------secured Storeage ----------------------------------

class Secured extends StatelessWidget {
    const Secured({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SecureStoragePage(),
    );
  }
}


///---------------------------Rest API----------------------------------

class RestApi extends StatelessWidget {
    const RestApi({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter REST API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostScreen(),
    );
  }
}



///---------------------------ToDo RestApi----------------------------------

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ToDoListPage(),
    );
  }
}
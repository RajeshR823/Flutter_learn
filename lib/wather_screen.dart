import 'dart:convert';
import 'dart:ui';
import 'package:my_second_app/hourly_forecast_item.dart';
import 'package:flutter/material.dart';
import 'package:my_second_app/secrets.dart';
import 'additional_information.dart';
import 'package:http/http.dart' as http;




class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String,dynamic>> weather;

  Future<Map<String,dynamic>> getCurrentWeather() async{

    try{
      String cityName = "London";
      final result = await http.get(
      Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$ApiKey"),
    );

    // print(result.body);

    final data = jsonDecode(result.body);
  
      // temp = data["main"]["temp"];
      if(data['cod'] != 200){
        throw data['message'];
      }
      return data;

    }
    catch(e){
      throw e.toString();
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      appBar: AppBar(
        title: const  Text("Weather App",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions:  [
          IconButton(onPressed: (){
            setState(() {
              weather = getCurrentWeather();
            });

          }, 
          icon: Icon(Icons.refresh),
          ),

        ],
      ),
      
      body:FutureBuilder(
        future:weather ,
        builder:(context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: const CircularProgressIndicator.adaptive());

          }

          if(snapshot.hasError){
            return  Text(snapshot.error.toString());
          }

          final data = snapshot.data!;

          final currentTemp = data["main"]["temp"];





          return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                
        
                  
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter:ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('$currentTemp K',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                             ),
                            ),
                            const SizedBox(height: 10),
                        
                            Icon(Icons.cloud,size:64),
                            const SizedBox(height: 10),
                            Text('Rain',style: TextStyle(
                              fontSize: 20,
                        
                        
                             ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                
                ),
              ),
              const SizedBox(height: 20,),
        
              const Text("Weather Forecast",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                
                ),
              ),
              
              // const SizedBox(height: 20,),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //         HourlyForecastItem(icon: Icons.cloud,time: "09:00",temperature: "301.54",),
              //         HourlyForecastItem(icon: Icons.cloud,time: "09:00",temperature: "301.54",),
              //         HourlyForecastItem(icon: Icons.cloud,time: "09:00",temperature: "301.54",),
              //         HourlyForecastItem(icon: Icons.cloud,time: "09:00",temperature: "301.54",),
              //         HourlyForecastItem(icon: Icons.cloud,time: "09:00",temperature: "301.54",),
        
                
              //     ],
                  
                
              //   ),
              // ),
            SizedBox(
              height: 140,
              
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index){
                  
                  return   HourlyForecastItem(icon: Icons.cloud,time: "09:00",temperature: "301.54",);
              
              
              
              }),
            ),
            const SizedBox(height: 20),
            const Text("Additional Information",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
        
                
                ),
                
              ),
              const SizedBox(height: 20),
        
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionInformation(icon: Icons.water_drop,label: "Humidity",value: "94",),
                AdditionInformation(icon: Icons.air,label: "WindSpeed",value:"7.5"),
                AdditionInformation(icon: Icons.beach_access,label: "Pressure",value: "1006",),
              ],
             )
          
            ],
          ),
        );
        },
      ),
    
    );
  }
}

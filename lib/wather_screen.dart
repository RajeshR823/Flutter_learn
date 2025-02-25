import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});


  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      appBar: AppBar(
        title: const  Text("Weather App",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions:  [
          IconButton(onPressed: (){


          }, 
          icon: Icon(Icons.refresh),
          ),

        ],
      ),

      body: Padding(
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
                          Text('360 F',
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
            const SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                    HourlyForecastItem(),
                    HourlyForecastItem(),
                    HourlyForecastItem(),
                    HourlyForecastItem(),
                    HourlyForecastItem(),
                ],
                
              
              ),
            ),
            
          const SizedBox(height: 20),
          const Text("Additional Information",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,

              
              ),
              
            ),

            SingleChildScrollView(

              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
              
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Icon(Icons.water_drop, size: 40,),
                        const SizedBox(height: 10),
                        Text('Humidity',style: TextStyle(fontSize: 18),),
                        const SizedBox(height: 10),
                        Text('94',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                   const SizedBox(width: 40),
                    Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Icon(Icons.wind_power_outlined, size: 40,),
                        const SizedBox(height: 10),
                        Text('WindSpeed',style: TextStyle(fontSize: 18),),
                        const SizedBox(height: 10),
                        Text('7.67',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                     const SizedBox(width: 40),
                       Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Icon(Icons.upcoming, size: 40,),
                        const SizedBox(height: 10),
                        Text('Pressure',style: TextStyle(fontSize: 18),),
                        const SizedBox(height: 10),
                        Text('1006',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  )
                ],
              ),
            )
        
          ],
        ),
      ),
    
    );
  }
}


class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
                    elevation: 6,
                   
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12)
                      ), 
                      child: Column(
                       children: [
                        Text('09:00',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                         SizedBox(height: 8),
                                
                        Icon(Icons.cloud,size: 35,),
                                
                         SizedBox(height: 8),
                        Text('301.54',style: TextStyle(fontSize: 16),)
                       ],
                      ),
                    ),
                  );
              


  }
}
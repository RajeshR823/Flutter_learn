import 'package:flutter/cupertino.dart';
class CupertinoCurrencyConverter extends StatefulWidget {
  const CupertinoCurrencyConverter({super.key});

  @override
  State <CupertinoCurrencyConverter> createState() =>  _CupertinoCurrencyConverterState();
}

class _CupertinoCurrencyConverterState extends State <CupertinoCurrencyConverter> {
    double result =0;

    final TextEditingController textEditingController = TextEditingController();

    void convert (){
       result = double.parse(textEditingController.text);
        setState(() {});
    }

    @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return CupertinoPageScaffold(
        backgroundColor:  const Color.fromARGB(255, 255, 0, 0),
        navigationBar:const CupertinoNavigationBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          middle: Text('Hello World',style: TextStyle(
            color: Color.fromARGB(255, 179, 164, 144),
            fontWeight: FontWeight.bold,
            fontSize: 30,
            
            ),
          ),
        
          
        ),
        
        child:Center(
         child:  Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
                Text(
                result.toString(),
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0), 
                   
                 ),
                ),
                
                CupertinoTextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(),
                    borderRadius:BorderRadius.circular(10),
                    

                
                  ),
                  placeholder: "Enter Here",
                  // keyboardType: const TextInputType.numberWithOptions(
                  //   decimal: true,
                  //   signed: true,
                  // ),
                ),
               const SizedBox(height: 15),



               CupertinoButton(
                onPressed: convert,
                color: CupertinoColors.black,
                
                             
             
               // const ButtonStyle(
                // elevation: WidgetStatePropertyAll(50.0),
                // backgroundColor:WidgetStatePropertyAll(Color.fromARGB(255, 191, 181, 181)),
                // foregroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 0, 0, 0)),
                // minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
                // shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(10, 10))))
               
                
               
                           
               child: 
                const Text('Change'),),
            ],
                   ),
         ),
       )



      );
  }
}
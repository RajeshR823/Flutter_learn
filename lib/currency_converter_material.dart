import 'package:flutter/material.dart';



class CurrencyConverterMaterialPage extends StatefulWidget{
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() { 
    return _CurrencyConverterMaterialPageState();

  } 


}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage>{
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
        backgroundColor: const Color.fromARGB(255, 228, 228, 215),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 226, 226, 134),
          elevation: 0,
          title: const Text('Hello World',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            
            ),
          ),
          centerTitle: true,
          actions: [
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),

          ],
          leading: Icon(Icons.ac_unit_sharp),
          
        ),
        
        body:Center(
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
                
                TextField(
                  controller: textEditingController,
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
                  // keyboardType: const TextInputType.numberWithOptions(
                  //   decimal: true,
                  //   signed: true,
                  // ),
                ),
               const SizedBox(height: 15),
               ElevatedButton(
                onPressed: convert,
               style: TextButton.styleFrom(
                elevation: 50.0,
                backgroundColor:Color.fromARGB(255, 191, 181, 181),
                foregroundColor: Color.fromARGB(255, 0, 0, 0),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                )
                             
               ),
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







// class CurrencyConverterMaterial extends StatelessWidget{
//     const CurrencyConverterMaterial({super.key});

//  @override
//   Widget build(BuildContext context) {    
//       return Scaffold(
           
//     );
//   }
// }
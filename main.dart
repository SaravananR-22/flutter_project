import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String inputvalue = "";
  String calculatorvalue="";
  String operator="";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Display Area
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(
                    inputvalue,
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Button Grid
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calculator("7", Colors.white38),
                        calculator("8", Colors.white38),
                        calculator("9", Colors.white38),
                        calculator("/", Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calculator("4", Colors.white38),
                        calculator("5", Colors.white38),
                        calculator("6", Colors.white38),
                        calculator("*", Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calculator("1", Colors.white38),
                        calculator("2", Colors.white38),
                        calculator("3", Colors.white38),
                        calculator("-", Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calculator("0", Colors.white38),
                        calculator(".", Colors.white38),
                        calculator("=", Colors.orange),
                        calculator("+", Colors.orange),
                      ],
                    ),
                  ],
                ),

                // Clear Button
                calculator("clear", Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget calculator(String text, Color bgcolor) {
    
    return InkWell(
      onTap: (){

        if(text == "clear"){
          setState(() {
            inputvalue=" ";
            calculatorvalue="";
            operator="";
          });
        }
        else if(text=="+" || text=="-" || text=="*" || text=="/"){
            
           setState(() {
             calculatorvalue= inputvalue;
             inputvalue="";
             operator=text;
           });
        }
        else if(text =="="){
          setState(() {
          double calc=double.parse(calculatorvalue);
          double input=double.parse(inputvalue);

          if(operator=="+"){
            inputvalue=(calc +input).toString();
          }
          else if(operator=="-"){
            inputvalue=(calc -input).toString();
          }
          else if(operator=="*"){
            inputvalue=(calc *input).toString();
          }
          else if(operator=="/"){
            inputvalue=(calc /input).toString();
          }
          else {
          inputvalue = "Error";  // Handle division by zero
        }
          
           
            
              
           });
          

        }

           



        else{
          setState(() {
          inputvalue= inputvalue + text;
        });

        }

        
        
      },

    
    
    
    child:Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: bgcolor,
      ),
      height: MediaQuery.of(context).size.width / 5,
      width: MediaQuery.of(context).size.width / 5,
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
     ) );
  }
}





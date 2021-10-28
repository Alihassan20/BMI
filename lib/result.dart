import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  final double result;
  final bool isMale;
  final int age;
  String get resultPhrase {
    String resultText ="";
    if(result <= 18.5)  resultText='Under Weight';
    else if(result > 18.6 &&result <= 24.9) resultText='Normal';
    else if(result >= 25 && result <= 29.9) resultText='Over Weight';
    else  resultText='Obese';


    return resultText;
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:10.5 ,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
        ),
        title: const Text(
          '                     Result',
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromRGBO(154, 148, 131, 1),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              Text('Gender : ${isMale?'Male':'Female'}',style:const  TextStyle(
                fontWeight: FontWeight.bold,fontSize: 25,
              ),),
              Text('Result : ${result.toStringAsFixed(1)}',style:const  TextStyle(
                fontWeight: FontWeight.bold,fontSize: 25,
              ),),
              Text('Healthiness : $resultPhrase',style:const  TextStyle(
                fontWeight: FontWeight.bold,fontSize: 25,
              ),
              textAlign: TextAlign.center,),
              Text('age : ${age.toInt()}',style:const  TextStyle(
                fontWeight: FontWeight.bold,fontSize: 25,
              ),),

            ],
          ),
        ),
      ),
    );
  }
}

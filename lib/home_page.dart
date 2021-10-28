import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_00/result.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  double heightVal = 170;
  int age = 22;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "                      Body Mass Index",
        ),
        backgroundColor: const Color.fromRGBO(154, 148, 131, 1),
        elevation: 10.5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    buildExpanded('Male', Icons.male),
                    const SizedBox(
                      width: 12,
                    ),
                    buildExpanded('Female', Icons.female)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 153,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(199, 190, 162, 1)
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      const Text("Height",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                           Text(heightVal.toStringAsFixed(1),style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                          const Text(" cm"),
                        ],
                      ),
                      Slider(
                          value: heightVal, 
                          max: 220,
                          min: 90,
                          onChanged: (newValue){
                        setState(() {
                          heightVal=newValue;
                        });
                      })
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    buildExpanded1("Age"),
                    const SizedBox(
                      width: 12,
                    ),
                    buildExpanded1('Weight')
                  ],
                ),
              ),
              Container(

                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    var result=weight/pow(heightVal/100, 2) ;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => Result(
                              result: result,
                              isMale: isMale,
                              age: age,
                            )));
                  },
                  child: const Text(
                    "Calculate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  color: const Color.fromRGBO(154, 148, 131, 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildExpanded(String name, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (name == 'Male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: (isMale && name == 'Male') || (!isMale && name == 'Female')
                  ? const Color.fromRGBO(154, 148, 131, 1)
                  : const Color.fromRGBO(199, 190, 162, 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildExpanded1(
    String name,
  ) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: (isMale && name == 'Male') || (!isMale && name == 'Female')
                ? const Color.fromRGBO(154, 148, 131, 1)
                : const Color.fromRGBO(199, 190, 162, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name == "Age" ? age.toString() : weight.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag:name == "Age" ? 'age++' : 'weight++' ,
                  onPressed: () {
                    setState(() {
                      name == "Age" ? age++ : weight++;
                    });
                  },
                  child: const Icon(Icons.add),
                  backgroundColor: const Color.fromRGBO(154, 148, 131, 1),
                ),
                const SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  heroTag:name == "Age" ? 'age--' : 'weight--' ,
                  onPressed: () {
                    setState(() {
                      name == "Age" ? age-- : weight--;
                    });
                  },
                  child: const Icon(Icons.minimize),
                  backgroundColor: const Color.fromRGBO(154, 148, 131, 1),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

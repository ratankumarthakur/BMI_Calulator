//What's new I learnt 
//to display different types of data/answers
//to give color to elevated button
//need to convert TextEditingController 1st to string than to any other datatype
//convert one datatype to any other datatype
//when to use and when not to use setState function

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ); // MaterialApp
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wtcontroller=TextEditingController();     //for taking weight as input
  var ftcontroller=TextEditingController();     //for taking height in feet as input
  var incontroller=TextEditingController();     //for taking height in inches as input
  var result="";                                //this will store the message to display (underweight,overweight,healthy)
  var bgcolor=Colors.purple.shade200;           //for changing the color of backgroud wrt different health situations

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BODY MASS INDEX"),
          centerTitle: true,backgroundColor: Colors.purple,
        ),
      body: Container(
      color: bgcolor,
      child: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              height: 20),                                     //generally we use SizedBox(height:20) to give spacing between different widgets
              Image.asset("assets/images/img_1.png",width: 100,height: 100),
              TextField(
                controller: wtcontroller,
                decoration: const InputDecoration(
                    label: Text("enter your weight in kg"),
                    labelStyle: TextStyle(color: Colors.purple),
                    prefixIcon: FaIcon(FontAwesomeIcons.weightScale,size: 20,color: Colors.purple,)
                ),keyboardType: TextInputType.number,    //this works/useful in phones only as in laptop no one restrict us to use any key of keyboard
              ),
              Container(
                height: 10),
              TextField(
                controller: ftcontroller,
                decoration: const InputDecoration(
                    label: Text("enter your height in feet"),
                    labelStyle: TextStyle(color: Colors.purple),
                    prefixIcon: FaIcon(FontAwesomeIcons.horseHead,size: 20,color: Colors.purple,)
                ),keyboardType: TextInputType.number,
              ),
              Container(
                height: 10,
              ),
              TextField(
                controller: incontroller,
                decoration: const InputDecoration(
                    label: Text("enter your height in inches"),
                    labelStyle: TextStyle(color: Colors.purple),
                    prefixIcon: FaIcon(FontAwesomeIcons.horseHead,size: 20,color: Colors.purple,)
                ),keyboardType: TextInputType.number,
              ),
              Container(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton. styleFrom(primary: Colors.purple),         //this is used to give color to elevated button,to adjust height and width of 
                child: const Text('Calculate',style:Textstyle(color:Colors.purple),  //elevated button wrap it with a container and provide height and width 
                onPressed:(){
                  var wt=wtcontroller.text.toString();    //initially I think that we have to convert every input to string ,later convert it to whatever you want
                  var ft=ftcontroller.text.toString();
                  var inch= incontroller.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    var iWt = int.parse(wt);        //this is how we convert any datatype to integer
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var t1=(iFt*12)+iInch;
                    var t2=t1*2.54;
                    var t3=t2/100;
                    var bmi=iWt/(t3*t3);

                    var msg="";    //the message is kept empty initially so that nothing is visible till 1st input

                    if(bmi>25){
                      msg="You are overweight";
                      bgcolor=Colors.red.shade400;
                    }else if (bmi<=18){
                      msg="You are underweight";
                      bgcolor=Colors.yellow;
                    }else{
                      msg="You are healthy";
                      bgcolor=Colors.green.shade500;
                    }
                    setState(() {                                                 //preferably put only those things under setState that are going to be displayed
                      result="$msg \nYour BMI is : ${bmi.toStringAsFixed(2)} ";   //see at the bottom ,some concepts  
                    });

                  }else{
                    setState(() {
                      result="please fill all the slots";
                    });
                  }
                },
              ),Container(
                height: 20),
              Text(result,style: const TextStyle(fontSize: 24,color: Colors.black),)
            ],
          ),
        ),
      ),
    )
    );
  }
}


//to display a simple string or character
//result="ratan";

//to display a variable value with constant string
//result="ratan is a $variable_name boy";

//to perform an operation with constant string
//result="roll no ${20+7} ";

//result="ratan is a $1+2 boy"; wrong


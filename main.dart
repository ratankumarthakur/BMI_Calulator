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
  var wtcontroller=TextEditingController();
  var ftcontroller=TextEditingController();
  var incontroller=TextEditingController();
  var result="";
  var bgcolor=Colors.purple.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BODY MASS INDEX"),centerTitle: true,backgroundColor: Colors.purple,
        ),body: Container(
      color: bgcolor,
      child: Center(
        child: Container(
          width: 300,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(
              height: 20,
            ),
              Image.asset("assets/images/img_1.png",width: 100,height: 100),

              TextField(
                controller: wtcontroller,
                decoration: const InputDecoration(
                    label: Text("enter your weight in kg"),
                    prefixIcon: FaIcon(FontAwesomeIcons.weightScale,size: 20,color: Colors.purple,)
                ),keyboardType: TextInputType.number,
              ),
              Container(
                height: 10,
              ),

              TextField(
                controller: ftcontroller,
                decoration: const InputDecoration(
                    label: Text("enter your height in feet"),
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
                    prefixIcon: FaIcon(FontAwesomeIcons.horseHead,size: 20,color: Colors.purple,)
                ),keyboardType: TextInputType.number,
              ),
              Container(
                height: 50,
              ),
              ElevatedButton(style: ElevatedButton. styleFrom(primary: Colors.purple),
                child: const Text('Calculate'),
                onPressed:(){
                  var wt=wtcontroller.text.toString();
                  var ft=ftcontroller.text.toString();
                  var inch= incontroller.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var t1=(iFt*12)+iInch;
                    var t2=t1*2.54;
                    var t3=t2/100;
                    var bmi=iWt/(t3*t3);


                    var msg="";


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
                    setState(() {

                      result="$msg \nYour BMI is : ${bmi.toStringAsFixed(2)} ";
                    });


                  }else{
                    setState(() {
                      result="please fill all the slots";
                    });
                  }
                },
              ),Container(
                height: 20,
              ),
              Text(result,style: const TextStyle(fontSize: 24,color: Colors.black),)


            ],
          ),
        ),
      ),
    )
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var wtcontroller=TextEditingController();
var ftcontroller=TextEditingController();
var incontroller=TextEditingController();
var result="";
var bgcolor=Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       title: Text('Your BMI'),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(

            width: 275,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style:TextStyle(
                  fontSize: 34,fontWeight: FontWeight.bold
                ),),

                SizedBox(height: 21,),
                TextField(
                  controller:wtcontroller ,
                  decoration: InputDecoration(
                    label: Text('Enter your Weight(in kg)'),
                    prefixIcon: Icon(Icons.line_weight_outlined)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your Height(in ft)'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),
                TextField(
                  controller: incontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your Height(in inch'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(onPressed: (){
                   var wt=wtcontroller.text.toString();
                   var ft=ftcontroller.text.toString();
                   var inch=incontroller.text.toString();

                   if(wt != "" && ft !="" && inch != ""){
                     //BMI calculation
                     var iwt=int.parse(wt);
                     var ift=int.parse(ft);
                     var iInch=int.parse(inch);

                     var tInch=(ift *12)+iInch;
                     var tcm=tInch *2.54;
                     var tm=tcm/100;
                     var bmi=iwt/(tm*tm);
                     var msg="";
                     if(bmi>25){
                       msg="You are overweight";
                       bgcolor=Colors.orange.shade200;
                     }else if(bmi<18){
                       msg= "You are underweight";
                       bgcolor=Colors.red.shade200;
                     }else{
                       msg="You are Healthy";
                       bgcolor=Colors.lightGreen.shade200;
                     }
                     setState(() {
                       result=" $msg \n Your BMI is:  ${bmi.toStringAsFixed(4)}";
                     });


                   }else{
                       setState(() {
                         result="Please fill all required blanks!!";
                       });
                   }
                }, child:Text('Calculate') ),
                SizedBox(height:11,),
                Text(result,style: TextStyle(fontSize: 19))
              ],
            ),
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

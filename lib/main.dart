
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button.dart';

main(){
  runApp(module());
}

class module extends StatefulWidget {
  const module({super.key});

  @override
  State<module> createState() => _moduleState();
}

class _moduleState extends State<module> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: live(),
    );
  }
}

class live extends StatefulWidget {
  const live({super.key});

  @override
  State<live> createState() => _liveState();
}

class _liveState extends State<live> {


  String _output = '0';
  String _input = '0';
  String _ope = '0';
  double num1 = 0;
  double num2 = 0;


  void buttonPress(String value){
    print(value);
    setState(() {
      if(value == 'C'){
         _input = '0';
         _output =' 0';
         num1 =0;
         num2 = 0;
         _ope = '';
      }else if(value == '=') {
        num2 = double.parse(_input);


        if (_ope == '+') {
          _output = (num1 + num2).toString();
        }

        else if (_ope == '-') {
          _output = (num1 - num2).toString();
        }

        else if (_ope == 'x') {
          _output = (num1 * num2).toString();
        }






        else if (_ope == '÷') {
          _output = (num2 != 0) ? (num1 / num2).toString() : 'Error';
        }
        _input = _output;
      }else if(['+','-','x','÷',].contains(value)){
        num1 = double.parse(_input);
        _ope = value;
        _input = '';

      }else {
        if (_input == '0') {
          _input = value; // Replace 0 with the new digit
        } else {
          _input += value; // Continue adding digits
        }
        _output = _input;
      }
    }
    );
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title:  Text('Calculator',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(_output,style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  button(onClick: ()=> buttonPress('C'), color: Colors.white, textColor: Colors.black,text: 'C'),
                  button(onClick: () {  }, text: '±', color: Colors.white, textColor: Colors.black,),
                  button(onClick: ()=> buttonPress(''), text: '%', color: Colors.white, textColor: Colors.black,),
                  button(onClick: ()=> buttonPress('÷'), text: '÷', textColor: null,color: Colors.orange,),

                ],
              ),
            ],
          ),


          Row(
            children: [
              button(onClick:  ()=> buttonPress('7'), text: '7', textColor: null,),
              button(onClick: ()=> buttonPress('8'), text: '8', textColor: null,),
              button(onClick: ()=> buttonPress('9'), text: '9', textColor: null,),
              button(onClick: ()=> buttonPress('x'), text: 'x',color: Colors.orange, textColor: null,),

            ],
          ),
          Row(
            children: [
              button(onClick: ()=> buttonPress('4'), text: '4', textColor: null,),
              button(onClick: ()=> buttonPress('5'), text: '5', textColor: null,),
              button(onClick: ()=> buttonPress('6'), text: '6', textColor: null,),
              button(onClick: ()=> buttonPress('-'), text: '-',color: Colors.orange, textColor: null,),

            ],
          ),
          Row(
            children: [
              button(onClick:()=> buttonPress('1'), text: '1', textColor: null,),
              button(onClick: ()=> buttonPress('2'), text: '2', textColor: null,),
              button(onClick: ()=> buttonPress('3'), text: '3', textColor: null,),
              button(onClick: ()=> buttonPress('+'), text: '+',color: Colors.orange, textColor: null,),

            ],
          ),
          Row(
            children: [
              button(onClick: ()=> buttonPress('0'), text: '0', textColor: null,),
              button(onClick: ()=> buttonPress('.'), text: '.', textColor: null,),
              button(
                onClick: () {
                  setState(() {
                    if (_input.length > 1) {
                      _input = _input.substring(0, _input.length - 1);
                    } else {
                      _input = '0';
                    }
                    _output = _input;
                  });
                },
                text: '⌫', textColor: null,
              ),
              button(onClick: ()=> buttonPress('='), text: '=',color: Colors.orange, textColor: null,),

            ],
          ),

        ],
      ) ,



    );

  }
}



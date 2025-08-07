import 'package:flutter/material.dart';

class button extends StatelessWidget {


 final String text;
 final Color ? color;
 final Color? textColor;
 final VoidCallback onClick;





 button({
    super.key,

    required this.onClick,
    this.color,
    required this.text,
    required this.textColor,

  });

  @override
  Widget build(BuildContext context) {




    return Padding(
      padding:  EdgeInsets.all(16),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Colors.grey[800],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),


              ),

            minimumSize: Size(70, 70),
          ),
          onPressed: onClick,

          child: Text(text,style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),)),
    );

  }
}
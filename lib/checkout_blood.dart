import 'package:flutter/material.dart';
class CheckoutBlood extends StatefulWidget{
  final String patientName;

  const CheckoutBlood({super.key, required this.patientName});
  @override
  State<StatefulWidget> createState() =>CheckoutBloodState();

}
class CheckoutBloodState extends State<CheckoutBlood>{
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        child: SizedBox(
            width: 400,
            height: 500,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text('Request Summary',style: TextStyle(
                    fontSize: 25,fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 28,height: 28,),
                Text(
                  'Name: ${widget.patientName}',),
                SizedBox(height: 16),
                Text(
                  'Name: ${widget.patientName}',),
                SizedBox(height: 16),
                Text(
                  'Name: ${widget.patientName}',),
                SizedBox(height: 16),
                Text(
                  'Name: ${widget.patientName}',),
                SizedBox(height: 16),
                Text(
                  'Name: ${widget.patientName}',),
                SizedBox(height: 16),
                Text(
                  'Name: ${widget.patientName}',),
                SizedBox(height: 16),
                Text(
                  'Name: ${widget.patientName}',),
                SizedBox(width: 28,height: 58,),
                Center(
                  child: ElevatedButton(onPressed: (){
                    setState(() {

                    });
                  }, style: ElevatedButton.styleFrom(

                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,

                  ),
                    child: Text('Confirm'),
                  ),

                )

              ],
            ),
          ),
        )

    );
  }

}
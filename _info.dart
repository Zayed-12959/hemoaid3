import 'package:flutter/material.dart';
class info extends StatefulWidget{
  const info({super.key});
  @override
  State<StatefulWidget> createState() =>_InfoState();
}
class _InfoState extends State<info>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        child: Card(

      shadowColor: Colors.white70,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      elevation: 2,
      color: Colors.white,
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('Avatar.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),


              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tanin Tahsan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),),
                    Text('Sreekol Laxmikol, Dublia',

              ),
                    Text('data'),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('B+'),
                  Row(

                    children: [
                      IconButton(color: Colors.red.shade400, onPressed: (){}, icon: Icon(Icons.message)), SizedBox(width: 10),IconButton(color: Colors.red.shade400,onPressed: (){}, icon: Icon(Icons.call)),

                    ],
                  ),
                ],
              )

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: (){},
                child:Text('View Details'),
              ),
              ElevatedButton(onPressed: (){},
                child:Text('View Details'),
              )
            ],
          ),

        ],

      ),
      )
        )
    );

  }

}
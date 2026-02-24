import 'package:flutter/material.dart';
class Receiverinfo extends StatefulWidget{
  String name='';
  String address='';
  String bGroup='';
  Receiverinfo({super.key,required this.name, required this.address,required this.bGroup});
  @override
  State<StatefulWidget> createState() =>_ReceiverInfoState();
}
class _ReceiverInfoState extends State<Receiverinfo>{

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160,
        child: Card(

            shadowColor: Colors.white70,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                            Text(widget.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),),
                            Text(widget.address),
                          ],
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(widget.bGroup,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                          Row(

                            children: [
                              Text('2.5 km away',style: TextStyle(

                              ),)
                            ],
                          ),
                        ],
                      )

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              title: Text('Accept Request'),
                              content: Text('Are you sure you want to accept this blood request?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context), // close dialog
                                  child: Text('Cancel', style: TextStyle(color: Colors.grey)),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context); // close dialog
                                    // handle accept logic here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text('Accept', style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          );
                        },

                        child:Text('Accept Request',style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                      ),
                    ],
                  ),

                ],

              ),
            )
        )
    );

  }

}
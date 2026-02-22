import 'package:flutter/material.dart';
import 'listTile.dart';
import '_info.dart';

class Dashboard extends StatefulWidget {
  final String username;

  const Dashboard({super.key, required this.username});
  @override
  State<StatefulWidget> createState() => _DashBoardState();
}

class _DashBoardState extends State<Dashboard> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD32F2F),
        title: Center(
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),


        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search for donor',
                iconColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: listTile(username: widget.username),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      underline: SizedBox(),
                      value: selectedValue,
                      hint: Row(children: [
                        Icon(Icons.sort),
                        SizedBox(width: 15),
                        Text('Sort'),
                      ],),
                      items: [
                        DropdownMenuItem(value:'',child:Text('Nearest location')),
                        DropdownMenuItem(value:'',child:Text('Last Donation Date'))
                      ],

                      onChanged:(value){
                        setState(() {
                          selectedValue=value;
                        });
                      }
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items:[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.bloodtype_outlined),label: 'Blood Request'),

          ]
      ),
    );
  }
}
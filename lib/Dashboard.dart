import 'package:flutter/material.dart';
import 'listTile.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<StatefulWidget> createState() => _DashBoardState();
}

class _DashBoardState extends State<Dashboard> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
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
      drawer: listTile(),
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
                      icon: Icon(Icons.sort_outlined),
                      borderRadius: BorderRadius.circular(10),
                      underline: SizedBox(),
                      value: selectedValue,
                      hint: Center(child: Text('Sort')),
                      items:[
                        DropdownMenuItem(value: 'Default', child: Text('Default')),
                        DropdownMenuItem(value: 'A+', child: Text('A+')),
                        DropdownMenuItem(value: 'A-', child: Text('A-')),
                        DropdownMenuItem(value: 'B+', child: Text('B+')),
                        DropdownMenuItem(value: 'B-', child: Text('A-')),
                        DropdownMenuItem(value: 'AB+', child: Text('AB+')),
                        DropdownMenuItem(value: 'AB-', child: Text('AB-')),
                        DropdownMenuItem(value: 'O+', child: Text('O+')),
                        DropdownMenuItem(value: 'O-', child: Text('O-')),
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

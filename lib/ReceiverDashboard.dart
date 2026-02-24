import 'package:flutter/material.dart';
import 'RequestForm.dart';
import 'listTile.dart';
import '_info.dart';
import 'profile_card.dart';

class Receiverdashboard extends StatefulWidget {
  final String username;

  const Receiverdashboard({super.key, required this.username});
  @override
  State<StatefulWidget> createState() => _DashBoardState();
}

class _DashBoardState extends State<Receiverdashboard> {
  bool showProfile = false;

  final List donors = [
    {
      'name': 'Tanin Tahsan',
      'location': 'Sreekol Laxmikol, Dublia',
      'bloodGroup': 'B+',
    },
    {
      'name': 'Imran Hossen',
      'location': 'Pabna Sadar, Pabna',
      'bloodGroup': 'A+',
    },
    {
      'name': 'Farjana Afrin',
      'location': 'Dhaka Sadar, Dhaka',
      'bloodGroup': 'O+',
    },
    {
      'name': 'Tanin Tahsan',
      'location': 'Sreekol Laxmikol, Dublia',
      'bloodGroup': 'B+',
    },
    {
      'name': 'Imran Hossen',
      'location': 'Pabna Sadar, Pabna',
      'bloodGroup': 'A+',
    },
    {
      'name': 'Farjana Afrin',
      'location': 'Dhaka Sadar, Dhaka',
      'bloodGroup': 'O+',
    }];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD32F2F),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 110),
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),



        //actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search,color: Colors.white,))],
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
      drawer: listTile(
        username: widget.username,
        onProfileClick: () {
          setState(() {
            showProfile = true; // show profile card
          });
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.grey.shade100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.3),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      underline: SizedBox(),

                      hint: Row(children: [
                        Icon(Icons.sort),
                        SizedBox(width: 15),
                        Text('Sort'),
                      ],),
                      items: [
                        DropdownMenuItem(value:'Nearest location',child:Text('Nearest location')),
                        DropdownMenuItem(value:'Last Donation Date',child:Text('Last Donation Date'))
                      ],

                      onChanged:(value){
                        setState(() {
                          value;
                        });
                      }
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.3),
                          blurRadius: 5,
                          offset:  Offset(0, 3),
                        )
                      ]
                  ),
                  child: DropdownButton(
                      borderRadius: BorderRadius.circular(30),
                      underline: SizedBox(),
                      hint: Row(children: [
                        Icon(Icons.filter_alt_outlined),
                        SizedBox(width: 15),
                        Text('Filter'),
                      ],),
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
                      onChanged: (value){}),
                ),
              ],
            ),
          ),

          Expanded(
            child: showProfile
                ? ListView(
              children: [
                ProfileCard(
                  fullName: widget.username,
                  bloodGroup: "O+",
                  age: 22,
                  location: "New York, USA",
                  imagePath: "Avatar.png",
                  donationCount: 7,
                ),
              ],
            )
                : ListView.builder(
              itemCount: donors.length,
              itemBuilder: (context, index) {
                return info(
                  name: donors[index]['name'],
                  address: donors[index]['location'],
                  bGroup: donors[index]['bloodGroup'],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items:[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),

            BottomNavigationBarItem(icon: Icon(Icons.bloodtype_outlined),label: 'Blood Request'),

          ],

          onTap: (index){
            if (index == 0) {
              setState(() {
                showProfile = false;
              });
            }
            else if(index==1){
              showDialog(
                  context: context,
                  builder: (context)=>Requestform()
              );
            }
          }

      ),
    );
  }
}
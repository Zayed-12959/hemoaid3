import 'package:flutter/material.dart';
import 'RequestForm.dart';
import 'listTile.dart';
import 'appTheme.dart';
import '_info.dart';
import 'ProfilePage.dart';
import 'profile_card.dart';

class ReceiverDashboard extends StatefulWidget {
  final String username;

  const ReceiverDashboard({super.key, required this.username});

  @override
  State<StatefulWidget> createState() => _ReceiverDashBoardState();
}

class _ReceiverDashBoardState extends State<ReceiverDashboard> {
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
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      //APP BAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Home", style: AppTheme.appBarStyle),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
        ),

        //SEARCH BAR
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: AppTheme.inputStyle,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search for donor',
                hintStyle: AppTheme.hintStyle,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: AppTheme.primaryRed),
                ),
              ),
            ),
          ),
        ),
      ),

      //DRAWER
      drawer: listTile(
        username: widget.username,
        onProfileClick: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(username: widget.username),
            ),
          );
          setState(() {
            showProfile = true;
          });
        },
      ),

      body: Column(
        children: [

          //SORT AND FILTER ROW
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // SORT DROPDOWN
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: AppTheme.primaryRed),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    underline: const SizedBox(),
                    hint: Row(
                      children: [
                        const Icon(Icons.sort),
                        const SizedBox(width: 15),
                        Text('Sort', style: AppTheme.labelStyle),
                      ],
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'Nearest location',
                        child: Text('Nearest location',
                            style: AppTheme.inputStyle),
                      ),
                      DropdownMenuItem(
                        value: 'Last Donation Date',
                        child: Text('Last Donation Date',
                            style: AppTheme.inputStyle),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        value;
                      });
                    },
                  ),
                ),

                // FILTER DROPDOWN
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color:AppTheme.primaryRed),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(30),
                    underline: const SizedBox(),
                    hint: Row(
                      children: [
                        const Icon(Icons.filter_alt_outlined),
                        const SizedBox(width: 15),
                        Text('Filter', style: AppTheme.labelStyle),
                      ],
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'Default',
                        child: Text('Default', style: AppTheme.inputStyle),
                      ),
                      DropdownMenuItem(
                        value: 'A+',
                        child: Text('A+', style: AppTheme.inputStyle),
                      ),
                      DropdownMenuItem(
                        value: 'A-',
                        child: Text('A-', style: AppTheme.inputStyle),
                      ),
                      DropdownMenuItem(
                        value: 'B+',
                        child: Text('B+', style: AppTheme.inputStyle),
                      ),
                      DropdownMenuItem(
                        value: 'B-',
                        child: Text('B-', style: AppTheme.inputStyle),
                      ),
                      DropdownMenuItem(
                        value: 'AB+',
                        child: Text('AB+', style: AppTheme.inputStyle),
                      ),
                      DropdownMenuItem(
                        value: 'AB-',
                        child: Text('AB-', style: AppTheme.inputStyle),
                      ),
                      DropdownMenuItem(
                        value: 'O+',
                        child: Text('O+', style: AppTheme.inputStyle),
                      ),
                      DropdownMenuItem(
                        value: 'O-',
                        child: Text('O-', style: AppTheme.inputStyle),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),

              ],
            ),
          ),

          //PROFILE OR DONOR LIST
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

      //BOTTOM NAV BAR
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppTheme.primaryRed,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: AppTheme.labelStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppTheme.primaryRed,
        ),


        unselectedLabelStyle: AppTheme.hintStyle.copyWith(
          fontSize: 12,
        ),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bloodtype_outlined),
            label: 'Blood Request',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            setState(() {
              showProfile = false;
            });
          } else if (index == 1) {
            showDialog(
              context: context,
              builder: (context) => Requestform(username: widget.username,),
            );
          }
        },
      ),
    );
  }
}
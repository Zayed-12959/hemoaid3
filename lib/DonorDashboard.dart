
import 'package:flutter/material.dart';
import 'package:hemoaid/ReceiverInfo.dart';
import 'appTheme.dart';
import 'listTile.dart';
import 'ProfilePage.dart';

class Donordashboard extends StatefulWidget {
  final String username;

  const Donordashboard({super.key, required this.username});

  @override
  State<StatefulWidget> createState() => _DonorDashBoardState();
}

class _DonorDashBoardState extends State<Donordashboard> {
  bool showProfile = false;

  final List receivers = [
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

      // ── APP BAR ───────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Home", style: AppTheme.appBarStyle),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
        ),
      ),

      // ── DRAWER ────────────────────────────────────────
      drawer: listTile(
        username: widget.username,
        onProfileClick: () {
          Navigator.pop(context); // close drawer first
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(username: widget.username),
            ),
          );
        },
      ),

      body: Column(
        children: [

          // ── STATUS BAR ────────────────────────────────
          Card(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(15),
                border: const Border(
                  left: BorderSide(color: Colors.green, width: 4),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status: Eligible to Donate',
                        style: AppTheme.labelStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Your last donation was 4 months ago.',
                        style: AppTheme.hintStyle.copyWith(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          // ── SORT DROPDOWN ─────────────────────────────
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
              ],
            ),
          ),

          // ── PROFILE OR RECEIVER LIST ──────────────────
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
            // ✅ Shows placeholder when list is empty
                : receivers.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 80,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No receivers found',
                    style: AppTheme.inputStyle.copyWith(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Check back later',
                    style: AppTheme.hintStyle,
                  ),
                ],
              ),
            )
                : ListView.builder(
              itemCount: receivers.length,
              itemBuilder: (context, index) {
                return Receiverinfo(
                  name: receivers[index]['name'],
                  address: receivers[index]['location'],
                  bGroup: receivers[index]['bloodGroup'],
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
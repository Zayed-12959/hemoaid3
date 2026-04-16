import 'package:flutter/material.dart';
import 'package:hemoaid3/ReceiverInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'appTheme.dart';
import 'listTile.dart';
import 'ProfilePage.dart';
import 'profile_card.dart';

class Donordashboard extends StatefulWidget {
  final String username;

  const Donordashboard({super.key, required this.username});

  @override
  State<StatefulWidget> createState() => _DonorDashBoardState();
}

class _DonorDashBoardState extends State<Donordashboard> {
  bool showProfile = false;

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
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Home", style: AppTheme.appBarStyle),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
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
        },
      ),

      body: Column(
        children: [

          //STATUS CARD — Step 5
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              bool eligible = true;
              if (snapshot.hasData && snapshot.data!.exists) {
                final data = snapshot.data!.data() as Map<String, dynamic>;
                eligible = data['eligible'] ?? true;
              }
              return Card(
                margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: eligible ? Colors.green.shade50 : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(15),
                    border: Border(
                      left: BorderSide(
                        color: eligible ? Colors.green : Colors.red,
                        width: 4,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        eligible ? Icons.check_circle : Icons.cancel,
                        color: eligible ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eligible
                                ? 'Status: Eligible to Donate'
                                : 'Status: Not Eligible',
                            style: AppTheme.labelStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: eligible ? Colors.green : Colors.red,
                            ),
                          ),
                          Text(
                            eligible
                                ? 'You can accept a blood request.'
                                : 'You have already accepted a request.',
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
              );
            },
          ),

          const SizedBox(height: 8),

          //SORT DROPDOWN
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
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),

          //PROFILE OR REQUEST LIST — Step 1 & 2
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
                : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('requests')
                  .where('status', isEqualTo: 'pending')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator());
                }
                if (!snapshot.hasData ||
                    snapshot.data!.docs.isEmpty) {
                  return const Center(
                      child: Text('No blood requests found'));
                }
                final requests = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final request = requests[index].data()
                    as Map<String, dynamic>;
                    return Receiverinfo(
                      docId: requests[index].id,
                      name: request['receiverUsername'] ?? 'Unknown',
                      address: request['address'] ?? 'No address',
                      bGroup: request['bloodGroup'] ?? '?',
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
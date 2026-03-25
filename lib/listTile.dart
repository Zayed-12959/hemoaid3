import 'package:flutter/material.dart';
import 'appTheme.dart';
import 'welcome.dart';

class listTile extends StatefulWidget {
  final String username;
  final VoidCallback? onProfileClick;

  const listTile({super.key, required this.username, required this.onProfileClick});

  @override
  State<StatefulWidget> createState() => _listTileState();
}

class _listTileState extends State<listTile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          // ── HEADER ────────────────────────────────────
          Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient, // ← gradient from AppTheme
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('Avatar.png'),
                ),
                SizedBox(height: 8),
                Text(
                  widget.username,
                  style: AppTheme.appBarStyle, // ← white bold Inter font
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // ── MENU ITEMS ────────────────────────────────
          ListTile(
            minVerticalPadding: 10,
            leading: Icon(Icons.person, color: AppTheme.primaryRed),
            title: Text('My Profile', style: AppTheme.tileStyle),
            onTap: () {
              Navigator.pop(context);
              if (widget.onProfileClick != null) widget.onProfileClick!();
            },
          ),

          ListTile(
            minVerticalPadding: 10,
            leading: Icon(Icons.settings, color: AppTheme.primaryRed),
            title: Text('Settings', style: AppTheme.tileStyle),
            onTap: () {},
          ),

          ListTile(
            minVerticalPadding: 10,
            leading: Icon(Icons.bar_chart, color: AppTheme.primaryRed),
            title: Text('Update Status', style: AppTheme.tileStyle),
            onTap: () {},
          ),

          ListTile(
            minVerticalPadding: 10,
            leading: Icon(Icons.privacy_tip, color: AppTheme.primaryRed),
            title: Text('Privacy Policy', style: AppTheme.tileStyle),
            onTap: () {},
          ),

          ListTile(
            minVerticalPadding: 10,
            leading: Icon(Icons.feedback, color: AppTheme.primaryRed),
            title: Text('Feedback', style: AppTheme.tileStyle),
            onTap: () {},
          ),

          ListTile(
            minVerticalPadding: 10,
            leading: Icon(Icons.question_mark_rounded, color: AppTheme.primaryRed),
            title: Text('About Us', style: AppTheme.tileStyle),
            onTap: () {},
          ),

          Spacer(), // pushes Log Out button to the bottom

          // ── LOG OUT BUTTON ────────────────────────────
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient, // ← gradient from AppTheme
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                        (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Log out', style: AppTheme.buttonStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
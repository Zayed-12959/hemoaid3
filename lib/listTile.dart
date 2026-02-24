import 'package:flutter/material.dart';
import 'welcome.dart';

class listTile extends StatefulWidget {
  final String username;
  final VoidCallback? onProfileClick;

  const listTile({super.key, required this.username, required this.onProfileClick,});

  @override
  State<StatefulWidget> createState() =>_listTileState();
}
class _listTileState extends State<listTile> {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              color: Color(0xFFD32F2F),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 20
                ),

                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('Avatar.png'),
                ),
                Expanded(
                  child: Text(widget.username,

                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),



              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.grey),
            title: Text('My Profile', style: TextStyle(letterSpacing: -0.5)),
            onTap: () {
              Navigator.pop(context); // close drawer
              if (widget.onProfileClick != null) widget.onProfileClick!();
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey),
            title: Text(
              'Settings',
              style: TextStyle(letterSpacing: -0.5),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.bar_chart, color: Colors.grey),
            title: Text(
              'Update Status',
              style: TextStyle(letterSpacing: -0.5),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: Colors.grey),
            title: Text(
              'Privacy Policy',
              style: TextStyle(letterSpacing: -0.5),
            ),

            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.feedback, color: Colors.grey),
            title: Text(
              'Feedback',
              style: TextStyle(letterSpacing: -0.5),
            ),
            onTap: () {},

          ),
          ListTile(
            leading: Icon(Icons.question_mark_rounded, color: Colors.grey),
            title: Text(
              'About Us',
              style: TextStyle(letterSpacing: -0.5),
            ),
            onTap: () {},

          ),
          SizedBox(
              height: 50
          ),
          ElevatedButton(onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Welcome()),
                  (route) => false, // removes all previous screens
            );
          },


              child: Text('Log out',
                style: TextStyle(
                  color: Colors.black,
                ),
              )
          )
        ],
      ),
    );
  }
}




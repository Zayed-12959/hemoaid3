import 'package:flutter/material.dart';
class listTile extends StatefulWidget {
  final String username;

  const listTile({super.key, required this.username});

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
                  Text(widget.username,

                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                  // Text('tahsantanin6@gmail.com',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w100,
                  //   ),
                  //
                  // ),

                ],
              ),
            ),
            ListTile

              (

              leading: Icon(Icons.person, color: Colors.grey),
              title: Text('My Profile', style: TextStyle(letterSpacing: -0.5)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey),
              title: Text(
                'Profile Settings',
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
            SizedBox(
                height: 50
            ),
            ElevatedButton(onPressed: () {},
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





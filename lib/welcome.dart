import 'package:flutter/material.dart';
import 'package:hemoaid3/Dashboard.dart';
import 'package:hemoaid3/registration.dart';

class Welcome extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  Welcome({super.key});  // cant use const because of controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFD32F2F),
        title: Text("Welcome", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        //leading: IconButton(onPressed: () {}, icon: Icon(Icons.person_2_outlined, color: Colors.white,)),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.menu_outlined, color: Colors.white,))
        // ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hemo Aid",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD32F2F),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50,bottom: 10,top: 30),
              child: TextField(
                controller: _usernameController,
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                    label: Text(
                      "Username",
                      style: TextStyle(
                          color: Colors.blue
                      ),
                    ),
                    suffixIcon: Icon(
                        Icons.person_2
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFD32F2F)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFD32F2F)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                    label: Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.blue
                      ),
                    ),
                    suffixIcon: Icon(
                        Icons.key_outlined
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFD32F2F)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFD32F2F)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Dashboard(username: _usernameController.text)
                  )
                );
              },
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Color(0xFFD32F2F),
                      fixedSize: Size(100,20)
                  ),

                  child: Text("Log in", style: TextStyle(color: Colors.white),)),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Registration()
                  )
                );
              },
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Color(0xFFD32F2F),
                      fixedSize: Size(100,20)
                  ),

                  child: Text("Sign up", style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}

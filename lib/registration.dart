import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  const Registration ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Register Your Account", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.person_2_outlined, color: Colors.white,)),
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
              "Sign Up",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50,bottom: 10,top: 30),
              child: TextField(
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
                            color: Colors.red
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
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
                            color: Colors.red
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: TextField(
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                    label: Text(
                      "Phone Number",
                      style: TextStyle(
                          color: Colors.blue
                      ),
                    ),
                    suffixIcon: Icon(
                        Icons.phone_enabled
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: TextField(
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                    label: Text(
                      "NID Number",
                      style: TextStyle(
                          color: Colors.blue
                      ),
                    ),
                    suffixIcon: Icon(
                        Icons.credit_card
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(onPressed: () {},
                  style: ButtonStyle(
                      elevation: WidgetStatePropertyAll(10),
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      fixedSize: WidgetStatePropertyAll(Size(100,20))
                  ),

                  child: Text("Confirm", style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
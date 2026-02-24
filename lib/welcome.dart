import 'package:flutter/material.dart';
//import 'package:hemoaid3/DonorDashboard.dart';
import 'package:hemoaid3/ReceiverDashboard.dart';
import 'package:hemoaid3/registration.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final TextEditingController _usernameController = TextEditingController();

  String selectedRole = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Color(0xFFD32F2F),
          title: Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
          centerTitle: true,
          //leading: IconButton(onPressed: () {}, icon: Icon(Icons.person_2_outlined, color: Colors.white,)),
          // actions: [
          //   IconButton(
          //       onPressed: () {},
          //       icon: Icon(Icons.menu_outlined, color: Colors.white,))
          // ],
        ),
        body: Stack(
            children: [


              Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color(0xFFD32F2F),
              ),


              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                ),
              ),


              SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedRole = "Donor";
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                selectedRole == "Donor" ? Color(0xFFD32F2F) : Colors.white,
                                foregroundColor:
                                selectedRole == "Donor" ? Colors.white : Color(0xFFD32F2F),
                                side: BorderSide(color: Color(0xFFD32F2F)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text("Donor"),
                            ),

                            SizedBox(width: 20),

                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedRole = "Receiver";
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                selectedRole == "Receiver" ? Color(0xFFD32F2F) : Colors.white,
                                foregroundColor:
                                selectedRole == "Receiver" ? Colors.white : Color(0xFFD32F2F),
                                side: BorderSide(color: Color(0xFFD32F2F)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text("Receiver"),
                            ),
                          ],
                        ),
                      ),

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
                          obscureText: true,
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
                          if(selectedRole == "Receiver"){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Receiverdashboard(username: _usernameController.text)
                            )
                            );
                          }
                          else if(selectedRole == "Donor"){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Receiverdashboard(username: _usernameController.text)
                            )
                            );
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("Please select Donor or Receiver")),
                            );
                          }

                        },
                            style: ElevatedButton.styleFrom(
                                elevation: 10,
                                backgroundColor: Color(0xFFD32F2F),
                                fixedSize: Size(100,20)
                            ),

                            child: Text("Log in", style: TextStyle(color: Colors.white),)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),

                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Registration(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]
        )
    );
  }
}
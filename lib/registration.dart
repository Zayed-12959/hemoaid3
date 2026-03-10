import 'package:flutter/material.dart';
import 'package:hemoaid/address.dart';

import 'address.dart';

class Registration extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  Registration ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFD32F2F),
        title: Text("Register Your Account", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, color: Colors.white,)),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.menu_outlined, color: Colors.white,))
        // ],
      ),
      body:
      Stack(
        children: [
          Container(
            color: const Color(0xFFD32F2F),
            width: double.infinity,
            height: double.infinity,
          ),

          // white bg
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
            ),
          ),

          // Progress Bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: index == 0
                            ? Colors.white
                            : Colors.white30,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add_a_photo_rounded,
                  size: 55,
                  color: Color(0xFFD32F2F),
                ),
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 0,
            right: 0,
          child: SizedBox(
            height: 500,
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
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
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            label: Text(
                              "Username",
                              style: TextStyle(
                                  color: Colors.black54
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
                      padding: EdgeInsets.only(left: 50, right: 50,bottom: 10),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            label: Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.black54
                              ),
                            ),
                            suffixIcon: Icon(
                                Icons.mail_outline
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
                      padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                            label: Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.black54
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
                      padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            label: Text(
                              "Phone Number",
                              style: TextStyle(
                                  color: Colors.black54
                              ),
                            ),
                            suffixIcon: Icon(
                                Icons.phone_enabled
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
                      padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            label: Text(
                              "NID Number",
                              style: TextStyle(
                                  color: Colors.black54
                              ),
                            ),
                            suffixIcon: Icon(
                                Icons.credit_card
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
                            builder: (context) => AddressScreen()
                        )
                        );
                      },
                          style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(10),
                              backgroundColor: WidgetStatePropertyAll(Color(0xFFD32F2F)),
                              fixedSize: WidgetStatePropertyAll(Size(100,20))
                          ),

                          child: Text("Next", style: TextStyle(color: Colors.white),)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        ]
      ),
    );
  }
}
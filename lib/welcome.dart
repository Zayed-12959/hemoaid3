import 'package:flutter/material.dart';
import 'package:hemoaid3/DonorDashboard.dart';
import 'package:hemoaid3/ReceiverDashboard.dart';
import 'package:hemoaid3/registration.dart';
import 'appTheme.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final TextEditingController _usernameController = TextEditingController();
  bool _snackBarShown = false;
  String selectedRole = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          // ── LAYER 1: Gradient background ───────────────
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
            ),
          ),

          // ── LAYER 2: White rounded container at bottom ─
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
            ),
          ),

          // ── LAYER 3: Logo + HemoAid title ──────────────
          Positioned(
            top: MediaQuery.of(context).size.height * 0.13,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/logo.png",
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "HemoAid",
                    style: AppTheme.brandStyle,
                  ),
                ],
              ),
            ),
          ),

          // ── LAYER 4: Main content ───────────────────────
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  SizedBox(height: MediaQuery.of(context).size.height * 0.27),
                  SizedBox(height: 80),

                  // Welcome title
                  Text("Welcome!", style: AppTheme.welcomeStyle),

                  SizedBox(height: 50),

                  // Subtitle
                  Text(
                    "What would you like to be today?",
                    style: AppTheme.subtitleStyle,
                  ),

                  // ── DONOR / RECEIVER BUTTONS ────────────
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Donor button
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedRole = "Donor";
                              _snackBarShown = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedRole == "Donor"
                                ? AppTheme.primaryRed
                                : Colors.grey[100],
                            foregroundColor: selectedRole == "Donor"
                                ? Colors.grey[100]
                                : AppTheme.primaryRed,
                            side: BorderSide(color: AppTheme.primaryRed),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text("Donor"),
                        ),

                        SizedBox(width: 20),

                        // Receiver button
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedRole = "Receiver";
                              _snackBarShown = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedRole == "Receiver"
                                ? AppTheme.primaryRed
                                : Colors.grey[100],
                            foregroundColor: selectedRole == "Receiver"
                                ? Colors.grey[100]
                                : AppTheme.primaryRed,
                            side: BorderSide(color: AppTheme.primaryRed),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text("Receiver"),
                        ),

                      ],
                    ),
                  ),

                  // ── USERNAME FIELD ──────────────────────
                  Container(
                    padding: EdgeInsets.only(
                        left: 50, right: 50, bottom: 10, top: 40),
                    child: TextField(
                      controller: _usernameController,
                      style: AppTheme.inputStyle,
                      decoration: InputDecoration(
                        label: Text("Username", style: AppTheme.labelStyle),
                        suffixIcon: Icon(Icons.person_2),
                        enabledBorder: AppTheme.inputBorder,
                        focusedBorder: AppTheme.inputBorder,
                      ),
                    ),
                  ),

                  // ── PASSWORD FIELD ──────────────────────
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 50, top: 10),
                    child: TextField(
                      style: AppTheme.inputStyle,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("Password", style: AppTheme.labelStyle),
                        suffixIcon: Icon(Icons.key_outlined),
                        enabledBorder: AppTheme.inputBorder,
                        focusedBorder: AppTheme.inputBorder,
                      ),
                    ),
                  ),

                  // ── LOG IN BUTTON ───────────────────────
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    width: 120,
                    height: 70,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppTheme.primaryGradient,
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
                          if (selectedRole == "Receiver") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReceiverDashboard(
                                    username: _usernameController.text),
                              ),
                            );
                          } else if (selectedRole == "Donor") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Donordashboard(
                                    username: _usernameController.text),
                              ),
                            );
                          } else {
                            if (!_snackBarShown) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Please select Donor or Receiver"),
                                ),
                              );
                              _snackBarShown = true;
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text("Log in", style: AppTheme.buttonStyle),
                      ),
                    ),
                  ),

                  // ── DON'T HAVE AN ACCOUNT ───────────────
                  Container(
                    padding: EdgeInsets.only(top: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: AppTheme.labelStyle,
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
                              style: AppTheme.signUpStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
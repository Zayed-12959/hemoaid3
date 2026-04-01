import 'package:flutter/material.dart';
import 'package:hemoaid/ReceiverDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'appTheme.dart';
import 'welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registration extends StatefulWidget {
  Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  // FirebaseAuth.instance is like a singleton in C++
// one global object that handles all auth operations
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// tracks if the app is busy registering
// used to show a loading spinner on the button
  bool _isLoading = false;

  // ── PERSONAL INFO CONTROLLERS ──────────────────────────
  final TextEditingController _usernameController  = TextEditingController();
  final TextEditingController _emailController     = TextEditingController();
  final TextEditingController _passwordController  = TextEditingController();
  final TextEditingController _phoneController     = TextEditingController();
  final TextEditingController _nidController       = TextEditingController();
  final TextEditingController _addressController   = TextEditingController();

  // ── BLOOD GROUP VARIABLES ──────────────────────────────
  String? selectedBloodGroup;
  final List<String> bloodGroups = [
    'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'
  ];

  // ── REGISTER FUNCTION ──────────────────────────────────
  // Future<void> _register() async {
  //   // check all fields are filled before trying
  //   if (_usernameController.text.isEmpty ||
  //       _emailController.text.isEmpty ||
  //       _passwordController.text.isEmpty ||
  //       _phoneController.text.isEmpty ||
  //       _nidController.text.isEmpty ||
  //       selectedBloodGroup == null) {
  //
  //     // show a snackbar if anything is empty
  //     // like a simple error popup in C++
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Please fill in all fields'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     return; // stop here, don't proceed
  //   }
  //
  //   // show loading spinner on button
  //   setState(() => _isLoading = true);
  //
  //   try {
  //     // createUserWithEmailAndPassword sends the email
  //     // and password to Firebase and creates an account
  //     // like calling an async API in C++:
  //     //   auto result = await api.createUser(email, password);
  //     await _auth.createUserWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim(),
  //     );
  //
  //     // after successful registration, navigate to Welcome
  //     // and remove all previous screens from the stack
  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => Welcome()),
  //           (route) => false,
  //     );
  //
  //   } on FirebaseAuthException catch (e) {
  //     // FirebaseAuthException gives us specific error codes
  //     // like catching a specific exception type in C++:
  //     //   catch (FirebaseAuthException& e) { ... }
  //
  //     String message = 'Something went wrong';
  //
  //     if (e.code == 'email-already-in-use') {
  //       message = 'This email is already registered';
  //     } else if (e.code == 'weak-password') {
  //       message = 'Password must be at least 6 characters';
  //     } else if (e.code == 'invalid-email') {
  //       message = 'Please enter a valid email address';
  //     }
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(message),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //
  //   } finally {
  //     // finally always runs whether success or error
  //     // like a destructor in C++ — cleanup code
  //     setState(() => _isLoading = false);
  //   }
  // }

  Future<void> _register() async {
    if (_usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _nidController.text.isEmpty ||
        selectedBloodGroup == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Step 1: create Firebase Auth account
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Step 2: save extra data to Firestore
      // userCredential.user!.uid is the unique ID Firebase
      // gives every user — like a primary key in C++
      // We use it as the document ID so we can find this
      // user's data later
      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username':   _usernameController.text.trim(),
        'email':      _emailController.text.trim(),
        'phone':      _phoneController.text.trim(),
        'nid':        _nidController.text.trim(),
        'bloodGroup': selectedBloodGroup,
        'address':    _addressController.text.trim(),
        'createdAt':  FieldValue.serverTimestamp(),
      });

      // Step 3: navigate to Welcome after success
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Welcome()),
            (route) => false,
      );

    } on FirebaseAuthException catch (e) {
      String message = 'Something went wrong';

      if (e.code == 'email-already-in-use') {
        message = 'This email is already registered';
      } else if (e.code == 'weak-password') {
        message = 'Password must be at least 6 characters';
      } else if (e.code == 'invalid-email') {
        message = 'Please enter a valid email address';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );

    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ── APP BAR ─────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text("Register Your Account", style: AppTheme.appBarStyle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
        ),
      ),

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
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
            ),
          ),

          // ── LAYER 3: Profile photo icon ─────────────────
          Positioned(
            top: MediaQuery.of(context).size.height * 0.035,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 115,
                height: 115,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person_add_alt_1_rounded,
                  size: 80,
                  color: AppTheme.primaryRed,
                ),
              ),
            ),
          ),

          // ── LAYER 4: Scrollable card ─────────────────────
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
            bottom: 50,
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.cardRadius),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // ── SIGN UP TITLE ──────────────────────
                    Text("Sign Up", style: AppTheme.titleStyle),
                    const SizedBox(height: 20),

                    // ── USERNAME ───────────────────────────
                    _buildTextField(
                      controller: _usernameController,
                      hint: 'Username',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 15),

                    // ── EMAIL ──────────────────────────────
                    _buildTextField(
                      controller: _emailController,
                      hint: 'Email',
                      icon: Icons.mail,
                    ),
                    const SizedBox(height: 15),

                    // ── PASSWORD ───────────────────────────
                    _buildTextField(
                      controller: _passwordController,
                      hint: 'Password',
                      icon: Icons.key_outlined,
                      obscure: true,
                    ),
                    const SizedBox(height: 15),

                    // ── PHONE NUMBER ───────────────────────
                    _buildTextField(
                      controller: _phoneController,
                      hint: 'Phone Number',
                      icon: Icons.phone_enabled,
                    ),
                    const SizedBox(height: 15),

                    // ── NID NUMBER ─────────────────────────
                    _buildTextField(
                      controller: _nidController,
                      hint: 'NID Number',
                      icon: Icons.credit_card,
                    ),
                    const SizedBox(height: 20),

                    // ── ADDRESS (expandable) ───────────────
                    TextField(
                      controller: _addressController,
                      maxLines: null,
                      maxLength: 150,
                      style: AppTheme.inputStyle,
                      decoration: InputDecoration(
                        hintText: 'Enter your current address',
                        hintStyle: AppTheme.hintStyle,
                        filled: true,
                        fillColor: Colors.red[50],
                        suffixIcon: const Icon(Icons.home),
                        counterStyle: AppTheme.hintStyle,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppTheme.primaryRed),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppTheme.primaryRed),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ── BLOOD GROUP SELECTOR ───────────────
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) {
                            return SizedBox(
                              height: 220,
                              child: Column(
                                children: [

                                  // drag handle
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 12, bottom: 8),
                                    width: 40,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),

                                  // scrollable list
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: bloodGroups.length,
                                      itemBuilder: (context, index) {
                                        final item = bloodGroups[index];
                                        final bool isSelected =
                                            selectedBloodGroup == item;
                                        return ListTile(
                                          title: Text(
                                            item,
                                            style: isSelected
                                                ? AppTheme.inputStyle.copyWith(
                                              color: AppTheme.primaryRed,
                                              fontWeight: FontWeight.bold,
                                            )
                                                : AppTheme.inputStyle,
                                          ),
                                          trailing: isSelected
                                              ? Icon(Icons.check,
                                              color: AppTheme.primaryRed)
                                              : null,
                                          onTap: () {
                                            setState(() =>
                                            selectedBloodGroup = item);
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.primaryRed),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedBloodGroup ?? 'Select Blood Group',
                              style: selectedBloodGroup != null
                                  ? AppTheme.inputStyle
                                  : AppTheme.hintStyle,
                            ),
                            Icon(Icons.keyboard_arrow_down,
                                color: AppTheme.labelText),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

// ── FINISH BUTTON ──────────────────────────────────────
                    Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        gradient: AppTheme.primaryGradient,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: _isLoading ? null : _register,
                        // _isLoading ? null : _register means:
                        // if loading → disable button (null)
                        // if not loading → call _register function
                        // like a conditional function pointer in C++

                        child: _isLoading
                            ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                            : Text('Finish', style: AppTheme.buttonStyle),
                        // shows a spinner while loading
                        // shows "Finish" text when not loading
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  // ── REUSABLE TEXT FIELD ──────────────────────────────────
  // All 5 personal info fields are identical except for
  // hint, icon, and obscureText — so we extract them into
  // one function to avoid repeating the same 15 lines 5 times
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      style: AppTheme.inputStyle,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTheme.hintStyle,
        suffixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.red[50],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppTheme.primaryRed),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppTheme.primaryRed),
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 14),
      ),
    );
  }
}
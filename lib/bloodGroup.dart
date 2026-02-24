import 'package:flutter/material.dart';
import 'package:hemoaid/ReceiverDashboard.dart';
import 'package:hemoaid/welcome.dart';
import 'registration.dart';

class BloodGroupScreen extends StatefulWidget {
  @override
  State<BloodGroupScreen> createState() => _BloodGroupScreenState();
}

class _BloodGroupScreenState extends State<BloodGroupScreen> {
  String? selectedGroup;
  String? selectedRh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFD32F2F),
        centerTitle: true,
        title: const Text(
          "Pick Your Blood Group",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [

          // 🔴 Red background
          Container(
            color: const Color(0xFFD32F2F),
            width: double.infinity,
            height: double.infinity,
          ),

          // ⚪ White curved bottom
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

          // 📊 Progress bar (Step 4 active)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: List.generate(4, (index) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // 🩸 Large Blood Icon
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
                  Icons.bloodtype,
                  size: 50,
                  color: Color(0xFFD32F2F),
                ),
              ),
            ),
          ),

          // 📦 Card
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

                      const Text(
                        "Select Blood Group",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD32F2F),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // 🅰️ Blood groups
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.8,
                        children: ['A', 'B', 'O', 'AB']
                            .map((group) => _bloodButton(group))
                            .toList(),
                      ),

                      const SizedBox(height: 20),

                      // ➕ ➖ Rh buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _rhButton('+'),
                          const SizedBox(width: 20),
                          _rhButton('-'),
                        ],
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD32F2F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Welcome(),
                              ),
                            );
                          },
                          child: const Text(
                            'Finish',
                            style: TextStyle(color: Colors.white),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── BLOOD GROUP BUTTON ─────────────────────
  Widget _bloodButton(String group) {
    final bool isSelected = selectedGroup == group;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGroup = group;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD32F2F) : Colors.red[50],
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Text(
          group,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : const Color(0xFFD32F2F),
          ),
        ),
      ),
    );
  }

  // ── RH BUTTON ──────────────────────────────
  Widget _rhButton(String value) {
    final bool isSelected = selectedRh == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRh = value;
        });
      },
      child: Container(
        width: 60,
        height: 45,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD32F2F) : Colors.red[50],
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : const Color(0xFFD32F2F),
          ),
        ),
      ),
    );
  }
}
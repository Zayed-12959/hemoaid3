import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {

  String? selectedDistrict;
  String? selectedPostOffice;
  String? selectedPoliceStation;

  final TextEditingController villageController = TextEditingController();
  final TextEditingController roadController = TextEditingController();

  final List<String> districts = ['Dhaka', 'Chittagong', 'Sylhet', 'Rajshahi'];
  final List<String> postOffices = ['Motijheel', 'Mirpur', 'Gulshan'];
  final List<String> policeStations = ['Dhanmondi', 'Gulshan', 'Mirpur'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [

          // ── LAYER 1: Full red background ──────────────────
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFD32F2F),
          ),

          // ── LAYER 2: Curved red shape at bottom ───────────
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: const BoxDecoration(
                color: Colors.white, // slightly darker red
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
            ),
          ),

          // ── LAYER 3: All the actual content ───────────────
          SafeArea(
            child: Column(
              children: [

                // ── TOP BAR ─────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back, color: Colors.white),
                      const Text(
                        'Address',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '3/4',
                        style: TextStyle(
                            color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                // ── PROGRESS BAR ────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(4, (index) {
                      return Expanded(
                        child: Container(
                          height: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: index < 3
                                ? Colors.white
                                : Colors.white30,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 20),

                // ── LOCATION PIN ICON ────────────────────────
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_on,
                    color: Color(0xFFD32F2F),
                    size: 110,
                  ),
                ),

                const SizedBox(height: 24),

                // ── FLOATING WHITE CARD ──────────────────────
                // margin on left/right = background peeks through
                // This is the KEY change from before
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    // subtle shadow to make it look "floating"
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // MainAxisSize.min = shrink to fit content
                    // like "width: fit-content" in CSS
                    // Without this the card would stretch to
                    // fill all remaining vertical space
                    children: [

                      // Dropdown: District
                      _buildDropdown(
                        hint: 'Select District*',
                        value: selectedDistrict,
                        items: districts,
                        onChanged: (val) =>
                            setState(() => selectedDistrict = val),
                      ),
                      const SizedBox(height: 12),

                      // Dropdown: Post Office
                      _buildDropdown(
                        hint: 'Select Post office*',
                        value: selectedPostOffice,
                        items: postOffices,
                        onChanged: (val) =>
                            setState(() => selectedPostOffice = val),
                      ),
                      const SizedBox(height: 12),

                      // Dropdown: Police Station
                      _buildDropdown(
                        hint: 'Select Police Station*',
                        value: selectedPoliceStation,
                        items: policeStations,
                        onChanged: (val) =>
                            setState(() => selectedPoliceStation = val),
                      ),
                      const SizedBox(height: 12),

                      // Text field: Village
                      _buildTextField(
                        controller: villageController,
                        hint: 'Enter Village/ Home*',
                      ),
                      const SizedBox(height: 12),

                      // Text field: Road
                      _buildTextField(
                        controller: roadController,
                        hint: 'Enter Road/Block/Sector',
                      ),
                      const SizedBox(height: 20),

                      // Next Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD32F2F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            print('Next tapped!');
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),

        ],

      ),
    );
  }

  // ── REUSABLE DROPDOWN WIDGET ─────────────────────────────
  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint, style: TextStyle(color: Colors.grey[600])),
          value: value,
          items: items
              .map((item) =>
              DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  // ── REUSABLE TEXT FIELD WIDGET ───────────────────────────
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none, // no visible border line
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
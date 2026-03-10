import 'package:flutter/material.dart';
import 'bloodGroup.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFD32F2F),
        centerTitle: true,
        title: const Text(
          "Address",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
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

          // Red bg
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
                        color: index <= 1
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

          // Home pic
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
                  Icons.add_location_alt,
                  size: 55,
                  color: Color(0xFFD32F2F),
                ),
              ),
            ),
          ),

          // card
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
                        "Address Details",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD32F2F),
                        ),
                      ),

                      const SizedBox(height: 20),

                      _buildDropdown(
                        hint: 'Select District*',
                        value: selectedDistrict,
                        items: districts,
                        onChanged: (val) =>
                            setState(() => selectedDistrict = val),
                      ),

                      const SizedBox(height: 15),

                      _buildDropdown(
                        hint: 'Select Post Office*',
                        value: selectedPostOffice,
                        items: postOffices,
                        onChanged: (val) =>
                            setState(() => selectedPostOffice = val),
                      ),

                      const SizedBox(height: 15),

                      _buildDropdown(
                        hint: 'Select Police Station*',
                        value: selectedPoliceStation,
                        items: policeStations,
                        onChanged: (val) =>
                            setState(() => selectedPoliceStation = val),
                      ),

                      const SizedBox(height: 15),

                      _buildTextField(
                        controller: villageController,
                        hint: 'Village / Home*',
                      ),

                      const SizedBox(height: 15),

                      _buildTextField(
                        controller: roadController,
                        hint: 'Road / Block / Sector',
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
                          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BloodGroupScreen(),
                            ),
                          );},
                          child: const Text(
                            'Next',
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

  //dropdown
  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.red[50],
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

  //text-field
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
        fillColor: Colors.red[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
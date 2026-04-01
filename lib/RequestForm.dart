// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hemoaid/checkout_blood.dart';
//
// import 'ReceiverDashboard.dart';
//
// class Requestform extends StatefulWidget {
//   const Requestform({super.key});
//   @override
//   State<StatefulWidget> createState() => _RequestFormState();
// }
//
// class _RequestFormState extends State<Requestform> {
//   bool isUrgent=false;
//   String? selectedRequestType;
//   String? selectedDistrict;
//
//   TextEditingController patientNameController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       child: SizedBox(
//         width: 400,
//         height: 900,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Request Of Blood',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(Icons.close),
//                     ),
//                   ],
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Image.asset(
//                     "assets/Blood.png",
//                     width: 100,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     controller: patientNameController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       hintText: 'Patient Name',
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       hintText: 'Medical Name',
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       hintText: 'Phone Number',
//
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: DropdownButton(
//                       dropdownColor: Colors.grey.shade200,
//                       underline: SizedBox(),
//                       isExpanded: true,
//                       value: selectedRequestType,
//                       hint: Text('Select Request Type'),
//                       items: [
//                         DropdownMenuItem(value: 'Urgent', child: Text('Urgent')),
//                         DropdownMenuItem(value: 'Scheduled', child: Text('Scheduled')),
//
//                       ],
//                       onChanged: (value) {
//                         setState(() {
//
//
//                           if(value=='Urgent'){
//                             selectedRequestType='Urgent';
//                             isUrgent=true;
//
//                           }
//                           else{
//                             selectedRequestType='Scheduled';
//                             isUrgent=false;
//                           }
//                         });
//                       },
//
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: DropdownButton(
//                       dropdownColor: Colors.grey.shade200,
//                       underline: SizedBox(),
//                       isExpanded: true,
//                       hint: Text('Select Blood Group'),
//                       items: [
//                         DropdownMenuItem(value: 'A+', child: Text('A+')),
//                         DropdownMenuItem(value: 'A-', child: Text('A-')),
//                         DropdownMenuItem(value: 'B+', child: Text('B+')),
//                         DropdownMenuItem(value: 'B-', child: Text('B+')),
//                         DropdownMenuItem(value: 'AB+', child: Text('AB+')),
//                         DropdownMenuItem(value: 'AB-', child: Text('AB-')),
//                         DropdownMenuItem(value: 'O+', child: Text('O+')),
//                         DropdownMenuItem(value: 'O-', child: Text('O-')),
//                       ],
//                       onChanged: (value) {},
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       hintText: 'Unit/No of bags',
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     enabled: !isUrgent,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       hintText: 'Donation Date',
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//
//                 ),
//                 Padding(
//
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     enabled: !isUrgent,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       hintText: 'Donation Time',
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: DropdownButton(
//                       value: selectedDistrict,
//
//                       dropdownColor: Colors.grey.shade200,
//                       underline: SizedBox(),
//                       isExpanded: true,
//                       hint: Text('Select District'),
//                       items: [
//                         DropdownMenuItem(value: 'Dhaka', child: Text('Dhaka')),
//                         DropdownMenuItem(value: 'Chattogram', child: Text('Chattogram')),
//                         DropdownMenuItem(value: 'Sylhet', child: Text('Sylhet')),
//
//                       ],
//                       onChanged: (value) {
//                         setState(() {
//                           selectedDistrict=value;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey.shade200,
//                       hintText: 'Address',
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(50.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) => CheckoutBlood(
//                           patientName: patientNameController.text,
//                           /*medicalName: medicalNameController.text,
//                             phone: phoneController.text,
//                             unit: unitController.text,
//                             date: dateController.text,
//                             time: timeController.text,
//                             address: addressController.text,
//                             bloodGroup: selectedBloodGroup,
//                             district: selectedDistrict,
//                             requestType: selectedRequestType,*/
//                         ),
//                       );
//                     },
//
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.black,
//                       backgroundColor: Colors.grey.shade200,
//                     ),
//                     child: Text('Make Request'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hemoaid/checkout_blood.dart';
import 'appTheme.dart';

class Requestform extends StatefulWidget {
  const Requestform({super.key});

  @override
  State<StatefulWidget> createState() => _RequestFormState();
}

class _RequestFormState extends State<Requestform> {
  bool isUrgent = false;
  String? selectedRequestType;
  String? selectedDistrict;

  final TextEditingController patientNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
      child: SizedBox(
        width: 400,
        height: 900,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [

                // ── TITLE ROW ──────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Request Of Blood',
                      style: AppTheme.titleStyle.copyWith(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, color: AppTheme.primaryRed),
                    ),
                  ],
                ),

                // ── BLOOD IMAGE ────────────────────────
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset("assets/Blood.png", width: 100),
                ),

                // ── PATIENT NAME ───────────────────────
                _buildTextField(
                  controller: patientNameController,
                  hint: 'Patient Name',
                ),

                // ── MEDICAL NAME ───────────────────────
                _buildTextField(hint: 'Medical Name'),

                // ── PHONE NUMBER ───────────────────────
                _buildTextField(
                  hint: 'Phone Number',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),

                // ── REQUEST TYPE DROPDOWN ──────────────
                _buildDropdown(
                  hint: 'Select Request Type',
                  value: selectedRequestType,
                  items: ['Urgent', 'Scheduled'],
                  onChanged: (value) {
                    setState(() {
                      if (value == 'Urgent') {
                        selectedRequestType = 'Urgent';
                        isUrgent = true;
                      } else {
                        selectedRequestType = 'Scheduled';
                        isUrgent = false;
                      }
                    });
                  },
                ),

                // ── BLOOD GROUP DROPDOWN ───────────────
                _buildDropdown(
                  hint: 'Select Blood Group',
                  value: null,
                  items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'],
                  onChanged: (value) {},
                ),

                // ── UNIT / NO OF BAGS ──────────────────
                _buildTextField(hint: 'Unit/No of bags'),

                // ── DONATION DATE (disabled if urgent) ─
                _buildTextField(
                  hint: 'Donation Date',
                  enabled: !isUrgent,
                ),

                // ── DONATION TIME (disabled if urgent) ─
                _buildTextField(
                  hint: 'Donation Time',
                  enabled: !isUrgent,
                ),

                // ── DISTRICT DROPDOWN ──────────────────
                _buildDropdown(
                  hint: 'Select District',
                  value: selectedDistrict,
                  items: ['Dhaka', 'Chattogram', 'Sylhet'],
                  onChanged: (value) {
                    setState(() {
                      selectedDistrict = value;
                    });
                  },
                ),

                // ── ADDRESS ────────────────────────────
                _buildTextField(hint: 'Address'),

                // ── MAKE REQUEST BUTTON ────────────────
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CheckoutBlood(
                            patientName: patientNameController.text,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Make Request', style: AppTheme.buttonStyle),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── REUSABLE TEXT FIELD ──────────────────────────────────
  Widget _buildTextField({
    TextEditingController? controller,
    required String hint,
    bool enabled = true,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        enabled: enabled,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        style: AppTheme.inputStyle,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: hint,
          hintStyle: AppTheme.hintStyle,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primaryRed),
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // ── REUSABLE DROPDOWN ────────────────────────────────────
  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            dropdownColor: Colors.grey.shade200,
            isExpanded: true,
            value: value,
            hint: Text(hint, style: AppTheme.hintStyle),
            items: items
                .map((item) => DropdownMenuItem(
              value: item,
              child: Text(item, style: AppTheme.inputStyle),
            ))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
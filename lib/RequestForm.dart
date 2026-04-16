import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hemoaid3/checkout_blood.dart';
import 'appTheme.dart';
import 'ReceiverDashboard.dart';

class Requestform extends StatefulWidget {
  final String username;
  const Requestform({super.key, required this.username});
  @override
  State<StatefulWidget> createState() => _RequestFormState();
}

class _RequestFormState extends State<Requestform> {
  bool isUrgent = false;
  String? selectedRequestType;
  String? selectedDistrict;
  String? selectedBloodGroup;

  TextEditingController patientNameController = TextEditingController();
  TextEditingController medicalNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController donationDateController = TextEditingController();
  TextEditingController donationTimeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    patientNameController.dispose();
    medicalNameController.dispose();
    phoneController.dispose();
    unitController.dispose();
    donationDateController.dispose();
    donationTimeController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        toolbarHeight: 90,
        title: Text('Make Request', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              //TITLE ROW
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

              //BLOOD IMAGE
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("assets/Blood.png", width: 100),
              ),

              _buildTextField(
                controller: patientNameController,
                hint: 'Patient Name',
              ),

              _buildTextField(
                controller: medicalNameController,
                hint: 'Medical Name',
              ),

              _buildTextField(
                controller: phoneController,
                hint: 'Phone Number',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),

              _buildDropdown(
                hint: 'Select Request Type',
                value: selectedRequestType,
                items: ['Urgent', 'Scheduled'],
                onChanged: (value) {
                  setState(() {
                    selectedRequestType = value;
                    isUrgent = value == 'Urgent';
                  });
                },
              ),

              _buildDropdown(
                hint: 'Select Blood Group',
                value: selectedBloodGroup,
                items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'],
                onChanged: (value) {
                  setState(() {
                    selectedBloodGroup = value;
                  });
                },
              ),

              _buildTextField(
                controller: unitController,
                hint: 'Unit/No of bags',
              ),

              _buildTextField(
                controller: donationDateController,
                hint: 'Donation Date',
                enabled: !isUrgent,
              ),

              _buildTextField(
                controller: donationTimeController,
                hint: 'Donation Time',
                enabled: !isUrgent,
              ),

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

              _buildTextField(
                controller: addressController,
                hint: 'Address',
              ),

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
                          username: widget.username,
                          patientName: patientNameController.text,
                          medicalName: medicalNameController.text,
                          phoneNumber: phoneController.text,
                          requestType: selectedRequestType ?? '',
                          bloodGroup: selectedBloodGroup ?? '',
                          unit: unitController.text,
                          district: selectedDistrict ?? '',
                          address: addressController.text,
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
    );
  }

  //TEXT FIELD
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

  // DROPDOWN
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
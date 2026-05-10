import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/utils/ColorUtils.dart';
import 'package:sant_flutter_appp/utils/CustomText.dart';
import 'package:sant_flutter_appp/utils/StringUtils.dart';
import 'package:sant_flutter_appp/utils/Utilities.dart';
import 'package:sant_flutter_appp/utils/dob_input_formater.dart';

import '../../utils/CustomAppBar.dart';
import '../../utils/CustomButton.dart';
import '../../utils/CustomTextFormField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final dobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  String? _selectedGender;
  String? _selectedRole;
  String? _selecedSampraday;
  String? _selectedCity;
  String? _selectedState;

  final List<String> genderList = ['Male', 'Female',];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> roleList = [
    'Admin',
    'Member',
    'Volunteer',
    'Trustee',
    'Guest',
  ];

  final List<String> sampradaysList = [
    'Swaminarayan',
    'Vaishnav',
    'Shaiva',
    'Shakta',
    'Smarta',
    'Other',
  ];

  final List<String> stateList = [
    'Gujarat',
    'Maharashtra',
    'Rajasthan',
    'Madhya Pradesh',
    'Uttar Pradesh',
    'Karnataka',
    'Tamil Nadu',
    'Delhi',
    'West Bengal',
    'Other',
  ];

  final Map<String, List<String>> cityList = {
    'Gujarat': ['Ahmedabad', 'Surat', 'Vadodara', 'Rajkot', 'Bhavnagar', 'Jamnagar'],
    'Maharashtra': ['Mumbai', 'Pune', 'Nagpur', 'Nashik', 'Aurangabad'],
    'Rajasthan': ['Jaipur', 'Jodhpur', 'Udaipur', 'Ajmer', 'Kota'],
    'Madhya Pradesh': ['Bhopal', 'Indore', 'Gwalior', 'Jabalpur'],
    'Uttar Pradesh': ['Lucknow', 'Kanpur', 'Agra', 'Varanasi', 'Allahabad'],
    'Karnataka': ['Bengaluru', 'Mysuru', 'Hubli', 'Mangaluru'],
    'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai', 'Tiruchirappalli'],
    'Delhi': ['New Delhi', 'Dwarka', 'Rohini', 'Saket'],
    'West Bengal': ['Kolkata', 'Howrah', 'Durgapur', 'Asansol'],
    'Other': ['Other'],
  };

  List<String> get _cities =>
      _selectedState != null ? (cityList[_selectedState] ?? []) : [];

  String? _validateDob(String? value) {
    if (value == null || value.isEmpty) return 'Date of birth is required';

    final parts = value.split('-');
    if (parts.length != 3) return 'Enter date as DD-MM-YYYY';

    final dayStr = parts[0];
    final monthStr = parts[1];
    final yearStr = parts[2];

    if (dayStr.length != 2 || monthStr.length != 2 || yearStr.length != 4) {
      return 'Enter complete date as DD-MM-YYYY';
    }

    final day = int.tryParse(dayStr);
    final month = int.tryParse(monthStr);
    final year = int.tryParse(yearStr);

    if (day == null || month == null || year == null) return 'Invalid date';

    if (day < 1 || day > 31) return 'Day must be between 01 and 31';
    if (month < 1 || month > 12) return 'Month must be between 01 and 12';
    if (year < 1900 || year > DateTime.now().year) {
      return 'Enter a valid 4-digit year';
    }

    // Check days in month (including leap year)
    final daysInMonth = _daysInMonth(month, year);
    if (day > daysInMonth) {
      return 'Invalid date: $monthStr/$yearStr has only $daysInMonth days';
    }

    return null;
  }

  int _daysInMonth(int month, int year) {
    const days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (month == 2) {
      final isLeap =
          (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
      return isLeap ? 29 : 28;
    }
    return days[month];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    required String? Function(String?) validator,
    required Icon prefixIcon,
  }) {
    return FormField<String>(
      initialValue: value,
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: field.hasError
                      ? Colors.red
                      : Colors.grey.shade300,
                  width: 1,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    value: value,
                    isExpanded: true,
                    hint: Row(
                      children: [
                        prefixIcon,
                        const SizedBox(width: 10),
                        CustomText.TextRegular(
                          hint,color: colorHintText
                        ),
                      ],
                    ),
                    icon: Icon(Icons.keyboard_arrow_down_rounded,
                        color: colorPrimary),
                    borderRadius: BorderRadius.circular(12),
                    dropdownColor: colorWhite,
                    items: items
                        .map((item) => DropdownMenuItem(
                      value: item,
                      child: CustomText.TextRegular(item),
                    ))
                        .toList(),
                    onChanged: (v) {
                      onChanged(v);
                      field.didChange(v);
                    },
                  ),
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 6),
                child: Text(
                  field.errorText!,
                  style: const TextStyle(color: Colors.red, fontSize: 11),
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey,appBar: AppBar(), title: createAccountTitle,isBackIcon: true,),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Utilities.buildLogo(),

                const SizedBox(height: 28),

                CustomTextFormField(
                    controller: firstNameController,
                    hintText: firstName,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    prefixIcon: Icon(Icons.person_outline_rounded,color: colorPrimary,size: 22,),
                    onChange: (value){},
                    onTap:() {}
                ),

                const SizedBox(height: 10),

                // ── Password Field ──
                CustomTextFormField(
                    controller: lastNameController,
                    hintText: lastName,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    prefixIcon: Icon(Icons.person_outline_rounded,color: colorPrimary,size: 22,),
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    controller: emailController,
                    hintText: emailHint,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    prefixIcon: Icon(Icons.email_outlined,color: colorPrimary,size: 22,),
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    controller: phoneController,
                    hintText: phoneNo,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    isMobileNo: true,
                    prefixIcon: Icon(Icons.phone,color: colorPrimary,size: 22,),
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: dobController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [DobInputFormatter()],
                  validator: _validateDob,
                  decoration: InputDecoration(
                    hintText: 'DD-MM-YYYY',
                    hintStyle:
                    TextStyle(color: color8D8D94, fontSize: 14,fontFamily: CustomText.fontPoppins),
                    prefixIcon: Icon(Icons.calendar_today_outlined,
                        color: colorPrimary, size: 20),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorPrimary, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      const BorderSide(color: Colors.red, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      const BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // ── Gender Dropdown ──
                _buildDropdown(
                  hint: selectGender,
                  value: _selectedGender,
                  items: genderList,
                  prefixIcon: Icon(Icons.wc_outlined,
                      color: colorPrimary, size: 22),
                  onChanged: (v) => setState(() => _selectedGender = v),
                  validator: (v) =>
                  v == null ? 'Please select a gender' : null,
                ),
                const SizedBox(height: 10),

                // ── Role Dropdown ──
                _buildDropdown(
                  hint: selectRole,
                  value: _selectedRole,
                  items: roleList,
                  prefixIcon: Icon(Icons.badge_outlined,
                      color: colorPrimary, size: 22),
                  onChanged: (v) => setState(() => _selectedRole = v),
                  validator: (v) =>
                  v == null ? 'Please select a role' : null,
                ),
                const SizedBox(height: 10),

                // ── Sampraday Dropdown ──
                _buildDropdown(
                  hint: selectSampraday,
                  value: _selecedSampraday,
                  items: sampradaysList,
                  prefixIcon: Icon(Icons.temple_hindu_outlined,
                      color: colorPrimary, size: 22),
                  onChanged: (v) => setState(() => _selecedSampraday = v),
                  validator: (v) =>
                  v == null ? 'Please select a sampraday' : null,
                ),
                const SizedBox(height: 10),

                // ── State Dropdown ──
                _buildDropdown(
                  hint: 'Select State',
                  value: _selectedState,
                  items: stateList,
                  prefixIcon: Icon(Icons.map_outlined,
                      color: colorPrimary, size: 22),
                  onChanged: (v) => setState(() {
                    _selectedState = v;
                    _selectedCity = null; // Reset city on state change
                  }),
                  validator: (v) =>
                  v == null ? 'Please select a state' : null,
                ),
                const SizedBox(height: 10),

                // ── City Dropdown (depends on State) ──
                _buildDropdown(
                  hint: _selectedState == null
                      ? 'Select State first'
                      : 'Select City',
                  value: _selectedCity,
                  items: _cities,
                  prefixIcon: Icon(Icons.location_city_outlined,
                      color: colorPrimary, size: 22),
                  onChanged: _selectedState == null
                      ? (_) {}
                      : (v) => setState(() => _selectedCity = v),
                  validator: (v) =>
                  v == null ? 'Please select a city' : null,
                ),
                const SizedBox(height: 10),

                CustomTextFormField(
                    controller: passwordController,
                    hintText: passwordHint,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    prefixIcon: Icon(Icons.lock_outline_rounded,color: colorPrimary,size: 22,),
                    obscureText: true,
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height:10,),
                CustomTextFormField(
                    controller: confirmPasswordController,
                    hintText: confirmPasswordHint,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    isPrefixIcon: true,
                    prefixIcon: Icon(Icons.lock_outline_rounded,color: colorPrimary,size: 22,),
                    obscureText: true,
                    onChange: (value){},
                    onTap:() {}
                ),
                const SizedBox(height:20,),

                CustomButton(
                  text: signUp,
                  callback: (){

                  },
                ),

                const SizedBox(height: 32),

                _buildSignInRow()
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildSignInRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account? ",
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            'Sign In!',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: colorPrimary),
          ),
        ),
      ],
    );
  }
}

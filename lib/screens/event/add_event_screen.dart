import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sant_flutter_appp/cubits/internet/internet_cubit.dart';
import 'package:sant_flutter_appp/cubits/internet/internet_state.dart';
import 'package:sant_flutter_appp/utils/ImageUtils.dart';
import 'package:sant_flutter_appp/utils/StringUtils.dart';
import 'package:sant_flutter_appp/utils/Utilities.dart';

import '../../utils/ColorUtils.dart';
import '../../utils/ConstantUtils.dart';
import '../../utils/CustomAppBar.dart';
import '../../utils/CustomButton.dart';
import '../../utils/CustomText.dart';
import '../../utils/CustomTextFormField.dart';
import '../../utils/PreferenceUtils.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final eventNameController = TextEditingController();
  final eventLocationController = TextEditingController();
  final eventDescriptionController = TextEditingController();
  final dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> eventType = [
    'Puja',
    'Yatra',
    'Sammelan',
    'Utsav',
  ];

  String? _selectedEventType;

  File? _imageFile;
  var profilePic = "";

  Future<void> _showImageSourceDialog(BuildContext context, StateSetter setState, Function(File?) updateImage) async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colorWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.TextSemiBold(selectImage,color: colorText,fontSize: 16.0),

            GestureDetector(
              onTap: (){
                context.pop();
              },
              child: SvgPicture.asset(closeIcon,width: 30,height: 30,),
            )
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            GestureDetector(
              onTap: ()async{
                context.pop();
                final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);;
                if (pickedFile != null) {
                  setState(() {
                    updateImage(File(pickedFile.path));
                  });
                }
              },
              child: Row(
                children: [

                  Icon(Icons.camera,color: colorPrimary,size: 26,),

                  const SizedBox(width: 20,),

                  CustomText.TextMedium(captureFromCamera,fontSize: 14.0,color: colorText),

                  const SizedBox(width: 20,),

                ],
              ),
            ),

            const SizedBox(height: 20,),

            GestureDetector(
              onTap: ()async{
                context.pop();
                final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    updateImage(File(pickedFile.path));
                  });
                }
              },
              child: Row(
                children: [

                  Icon(Icons.photo_library,color: colorPrimary,size: 26,),

                  const SizedBox(width: 10,),

                  CustomText.TextMedium(pickFromGallery,fontSize: 14.0,color: colorText),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey,appBar: AppBar(), title: addEvent,isBackIcon: true,isMenuIcon: false,isNotificationIcon: false,),
      body: BlocBuilder<InternetCubit,InternetState>(
        builder: (context,state){
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [

                    const SizedBox(height: 15),

                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorABB5B3,
                        border: Border.all(
                          color: Colors.white, // Customize border color
                          width: 1.0, // Customize border width
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60.0),
                          child: _imageFile != null ? Image.file(_imageFile!,width: 70,height: 70,fit: BoxFit.cover) :
                          PreferenceUtils.getString(PREF_PROFILE).isEmpty ?
                          SvgPicture.asset(appLogo,width: 55,height: 55,fit: BoxFit.cover,) :
                          Image.network(
                            PreferenceUtils.getString(PREF_PROFILE),
                            width: 55,
                            height: 55,
                            fit: BoxFit.fill,
                            errorBuilder: (context,error,stack){
                              return ClipRRect(
                                  borderRadius: BorderRadius.circular(60.0),
                                  child: SvgPicture.asset(appLogo,width: 90,height: 110,fit: BoxFit.cover,)
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () => _showImageSourceDialog(context, setState, (File? newImage) {
                        setState(() {
                          _imageFile = newImage;
                        });
                      }),
                      child: CustomText.TextRegular("Click to Update",color: colorHintText,decoration: TextDecoration.underline),
                    ),
                    
                    const SizedBox(height: 15),

                    CustomTextFormField(
                        controller: eventNameController,
                        hintText: eventName,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        prefixIcon: Icon(Icons.person_outline_rounded,color: colorPrimary,size: 22,),
                        onChange: (value){},
                        onTap:() {}
                    ),

                    const SizedBox(height: 15),

                    // ── Password Field ──
                    CustomTextFormField(
                        controller: eventLocationController,
                        hintText: eventLocation,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        prefixIcon: Icon(Icons.location_on_outlined,color: colorPrimary,size: 22,),
                        onChange: (value){},
                        onTap:() {}
                    ),

                    const SizedBox(height: 15),

                    CustomTextFormField(
                        controller: eventDescriptionController,
                        hintText: eventDescription,
                        textInputType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        maxLines: 5,
                        radius: 20,
                        minLines: 5,
                        textAlign: TextAlign.start,
                        onChange: (value){},
                        onTap:() {}
                    ),

                    const SizedBox(height: 15),

                    CustomTextFormField(
                        controller: dateController,
                        hintText: eventDate,
                        textInputType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        isPrefixIcon: false,
                        isSuffixIcon: false,
                        isReadOnly: false,
                        textAlign: TextAlign.start,
                        onChange: (value){},
                        onTap:() {
                          Utilities.showDatePickerDialog(context).then((value){

                            debugPrint("value date : $value");

                          });
                        }
                    ),

                    const SizedBox(height: 15,),

                    _buildDropdown(
                      hint: eventSelectType,
                      value: _selectedEventType,
                      items: eventType,
                      prefixIcon: Icon(Icons.event,
                          color: colorPrimary, size: 22),
                      onChanged: (v) => setState(() => _selectedEventType = v),
                      validator: (v) =>
                      v == null ? 'Please select a event type' : null,
                    ),

                    const SizedBox(height: 15,),

                    CustomButton(
                      text: submit,
                      callback: (){

                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
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
                        CustomText.TextRegular(hint,color: colorHintText
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

}

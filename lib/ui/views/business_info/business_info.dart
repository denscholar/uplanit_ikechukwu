import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplanit_supplier/core/services/authentication_service.dart';
import 'package:uplanit_supplier/core/viewmodels/business_profile_model.dart';
import 'package:uplanit_supplier/ui/shared/profile_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uplanit_supplier/ui/views/business_profile/profile_image.dart';
import 'package:uplanit_supplier/ui/widgets/custom_button.dart';
import 'package:uplanit_supplier/ui/widgets/custom_textfield.dart';

class BusinessInfoPage extends StatefulWidget {
  static const String ROUTE = '/business_info/business_info';

  @override
  _BusinessInfoPageState createState() => _BusinessInfoPageState();
}

class _BusinessInfoPageState extends State<BusinessInfoPage> {
  var _dropItem = ['--Select--', 'A sole trader', 'A registered Company'];
  var currentItemSelected = '--Select--';
  bool selectionItem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 30, right: 20.0),
        child: ListView(
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Business information helps provide more information  about your business and company details. This information will be provided in invoices sent out from uplanit',
                    style: GoogleFonts.workSans(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left),
                SizedBox(height: 20),
                Text(
                  'What will you be trading as?',
                  style: GoogleFonts.workSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                DropdownButton<String>(
                    items: _dropItem.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem));
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      _onDropDownSelected(newValueSelected);
                    },
                    value: currentItemSelected),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  color: Colors.black,
                ),
                SizedBox(height: 3),
                Text(
                  'This cannot be changed after initial selection',
                  style: GoogleFonts.workSans(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                RegCompanyWidget(),
                SizedBox(height: 40),
                CustomButton(
                  onPressed: () => Navigator.pop(context),
                  title: 'Save',
                  style: GoogleFonts.workSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onDropDownSelected(newValueSelected) {
    setState(() {
      this.currentItemSelected = newValueSelected;
    });
  }
}

class SoleTraderWidget extends StatelessWidget {
  const SoleTraderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Business Representative',
          style: GoogleFonts.workSans(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomTextField(
          keyboardType: TextInputType.text,
          color: Colors.black,
        ),
        SizedBox(height: 20),
        Text(
          'Business phone numbers',
          style: GoogleFonts.workSans(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomTextField(
          keyboardType: TextInputType.phone,
          color: Colors.black,
        ),
      ],
    );
  }
}

class RegCompanyWidget extends StatelessWidget {
  const RegCompanyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Registered Company Name',
          style: GoogleFonts.workSans(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomTextField(
          keyboardType: TextInputType.text,
          color: Colors.black,
        ),
        SizedBox(height: 20),
        Text(
          'Business phone numbers',
          style: GoogleFonts.workSans(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomTextField(
          keyboardType: TextInputType.phone,
          color: Colors.black,
        ),
        SizedBox(height: 20),
        Text(
          'Business Representative',
          style: GoogleFonts.workSans(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomTextField(
          keyboardType: TextInputType.text,
          color: Colors.black,
        ),
        SizedBox(height: 20),
        Text(
          'Contact Phone Number',
          style: GoogleFonts.workSans(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomTextField(
          keyboardType: TextInputType.text,
          color: Colors.black,
        ),
      ],
    );
  }
}

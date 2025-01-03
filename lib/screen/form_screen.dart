import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture user input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  // Validation methods
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone cannot be empty';
    }
    if (value.length != 10) {
      return 'Phone number should be 10 digits';
    }
    return null;
  }

  String? _validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Country cannot be empty';
    }
    return null;
  }

  String? _validateState(String? value) {
    if (value == null || value.isEmpty) {
      return 'State cannot be empty';
    }
    return null;
  }

  String? _validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'City cannot be empty';
    }
    return null;
  }

  // Submit the form and reset fields
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // If form is valid, show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form Submitted Successfully!')),
      );

      // Reset all fields after submission
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _countryController.clear();
      _stateController.clear();
      _cityController.clear();
    } else {
      // If form is invalid, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please correct the errors in the form')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 51, 84, 1),
      appBar: AppBar(
        title: Text('Form with Validation', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xff0e1324),  // AppBar color matching the theme
        iconTheme: IconThemeData(color: Colors.white),  // Back button color white
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Form key to identify the form
          child: ListView(
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),  // Match label color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(245, 144, 29,0.9), width: 2.0), // Focused border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(252, 244, 235,0.9), width: 1.0), // Unfocused border color
                  ),
                ),
                style: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),
                cursorColor:Color.fromRGBO(252, 244, 235,0.9) ,
                validator: _validateName,
              ),
              SizedBox(height: 16),

              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),  // Match label color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(245, 144, 29,0.9), width: 2.0), // Focused border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(252, 244, 235,0.9), width: 1.0), // Unfocused border color
                  ),
                ),
                style: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),
                cursorColor:Color.fromRGBO(252, 244, 235,0.9) ,
                validator: _validateEmail,
              ),
              SizedBox(height: 16),

              // Phone Field
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),  // Match label color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(245, 144, 29,0.9), width: 2.0), // Focused border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(252, 244, 235,0.9), width: 1.0), // Unfocused border color
                  ),
                ),
                style: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),
                cursorColor:Color.fromRGBO(252, 244, 235,0.9) ,
                keyboardType: TextInputType.phone,
                validator: _validatePhone,
              ),
              SizedBox(height: 16),

              // Country Field
              TextFormField(
                controller: _countryController,
                decoration: InputDecoration(
                  labelText: 'Country',
                  labelStyle: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),  // Match label color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(245, 144, 29,0.9), width: 2.0), // Focused border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(252, 244, 235,0.9), width: 1.0), // Unfocused border color
                  ),
                ),
                style: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),
                validator: _validateCountry,
                cursorColor:Color.fromRGBO(252, 244, 235,0.9) ,
              ),
              SizedBox(height: 16),

              // State Field
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(
                  labelText: 'State',
                  labelStyle: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),  // Match label color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(245, 144, 29,0.9), width: 2.0), // Focused border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(252, 244, 235,0.9), width: 1.0), // Unfocused border color
                  ),
                ),
                style: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),
                validator: _validateState,
                cursorColor:Color.fromRGBO(252, 244, 235,0.9) ,
              ),
              SizedBox(height: 16),

              // City Field
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),  // Match label color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(245, 144, 29,0.9), width: 2.0), // Focused border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(252, 244, 235,0.9), width: 1.0), // Unfocused border color
                  ),
                ),
                style: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),
                cursorColor:Color.fromRGBO(252, 244, 235,0.9) ,
                validator: _validateCity,
              ),
              SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0e1324),  // Match button color with theme
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text('Submit', style: TextStyle(color: Color.fromRGBO(245, 144, 29,0.9))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

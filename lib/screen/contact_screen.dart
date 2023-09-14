import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:contact_form_app/screen/success_screen.dart';

class SaveContactScreen extends StatefulWidget {
  const SaveContactScreen({super.key});

  @override
  State<SaveContactScreen> createState() => _SaveContactScreenState();
}

class _SaveContactScreenState extends State<SaveContactScreen> {
  final _nameController = TextEditingController();
  // Controllers for the text fields
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the screen is disposed to avoid memory leaks
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future submit() async {
    // Extract text from controllers and trim any leading/trailing whitespace
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final address = _addressController.text.trim();
    // Check if any of the fields are empty

    if (name.isEmpty || email.isEmpty || phone.isEmpty || address.isEmpty) {
      // Display a SnackBar if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Fill all fields'),
          duration: Duration(
              seconds: 3), //Duration for how long the SnackBar is displayed
        ),
      );
    } else {
      // All fields are filled, call the function to add user details to Firestore
      addUserDetails(
        _nameController.text.trim(),
        _emailController.text.trim(),
        int.parse(_phoneController.text.trim()),
        _addressController.text.trim(),
      );
    }
  }

  Future addUserDetails(
      String name, String email, int phone, String address) async {
    try {
      // Add user details to Firestore
      await FirebaseFirestore.instance.collection('contacts').add({
        'Name': name,
        'Email': email,
        'Phone Number': phone,
        'Address': address,
      });
      // Data added successfully, you can add further actions here if needed.
    } catch (e) {
      // Handle any errors that occur during the Firestore operation.
      print('Error adding user details: $e');

      // Show an alert dialog with the error message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while saving data: $e'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Save Contacts !',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Enter the following details below.',
                style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Name',
                style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Container(
                color: Color.fromARGB(157, 53, 53, 53),
                child: TextField(
                  controller: _nameController,
                  style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: 'Enter your Name',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xffcf25af),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Container(
                color: Color.fromARGB(157, 53, 53, 53),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: 'Enter your Email',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xffcf25af),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Phone number',
                style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Container(
                color: Color.fromARGB(157, 53, 53, 53),
                child: TextField(
                  controller: _phoneController,
                  style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: 'Enter your Phone number',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xffcf25af),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Address',
                style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Container(
                color: Color.fromARGB(157, 53, 53, 53),
                child: TextField(
                  controller: _addressController,
                  style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: 'Enter your Address',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xffcf25af),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 160),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xffcf25af),
                ),
                onPressed: () {
                  final name = _nameController.text.trim();
                  final email = _emailController.text.trim();
                  final phone = _phoneController.text.trim();
                  final address = _addressController.text.trim();
                  if (name.isEmpty ||
                      email.isEmpty ||
                      phone.isEmpty ||
                      address.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Fill all fields carefully!'),
                        duration: Duration(
                            seconds: 2), // Adjust the duration as needed
                      ),
                    );
                  } else {
                    submit();
                    _nameController.clear();
                    _emailController.clear();
                    _phoneController.clear();
                    _addressController.clear();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SuccessScreen();
                    }));
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project1/screen/otp_verification.dart';

import 'home_screen.dart';

class PhoneAuthPage extends StatefulWidget {
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Verification'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height / 10),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Enter your phone number",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 20),
                  Container(
                    width: size.width / 1.1,
                    child: TextField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 20),
                  ElevatedButton(
                    onPressed: () {
                      _verifyPhoneNumber();
                    },
                    child: Text("Send OTP"),
                  ),
                ],
              ),
            ),
    );
  }

  void _verifyPhoneNumber() async {
    String phoneNumber = _phoneNumberController.text.trim();
    setState(() {
      isLoading = true;
    });
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed: $e");
        setState(() {
          isLoading = false;
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        print("OTP sent to $phoneNumber");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  OTPVerificationPage(verificationId: verificationId)),
        );
        setState(() {
          isLoading = false;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Auto retrieval timeout");
      },
      timeout: Duration(seconds: 60),
    );
  }
}

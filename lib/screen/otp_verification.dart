import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project1/screen/home_screen.dart';

class OTPVerificationPage extends StatefulWidget {
  final String verificationId;

  OTPVerificationPage({required this.verificationId});

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
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
                      "Enter OTP sent to your phone",
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
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter OTP",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 20),
                  ElevatedButton(
                    onPressed: () {
                      _verifyOTP();
                    },
                    child: Text("Verify OTP"),
                  ),
                ],
              ),
            ),
    );
  }

  void _verifyOTP() async {
    setState(() {
      isLoading = true;
    });

    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: _otpController.text.trim(),
      );

      await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } catch (e) {
      print("Error verifying OTP: $e");
    }

    setState(() {
      isLoading = false;
    });
  }
}

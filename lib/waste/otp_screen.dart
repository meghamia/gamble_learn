// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
// import 'package:project1/screen/phone.dart';
//
// class OtpAuth extends StatefulWidget {
//   const OtpAuth({super.key});
//
//   @override
//   State<OtpAuth> createState() => _OtpAuthState();
// }
//
// class _OtpAuthState extends State<OtpAuth> {
//   TextEditingController phoneController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.redAccent.shade100,
//                     Colors.pinkAccent.shade100,
//                     Colors.yellowAccent.shade100,
//                   ],
//                   begin: Alignment.bottomLeft,
//                   end: Alignment.bottomRight,
//                 )),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 130, top: 40),
//             child: Text(
//               "OTP Auth",
//               style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 30, right: 190),
//                 child: Text(
//                   "You can verify here",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: phoneController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                       hintText: "Enter Phone Number",
//                       suffixIcon: Icon(FontAwesomeIcons.phone),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       )),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   await FirebaseAuth.instance.verifyPhoneNumber(
//                     verificationCompleted:
//                         (PhoneAuthCredential credential) {},
//                     verificationFailed: (FirebaseAuthException e) {},
//                     codeSent: (String verificationid, int? resendtoken) {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (_) => OtpScreen(verificationid: verificationid,)));
//                     },
//                     codeAutoRetrievalTimeout: (String verificationid) {},
//                     phoneNumber: phoneController.text.toString(),
//                   );
//                 },
//                 child: Text("verify"),
//               ),
//             ],
//           ),
//
//         ],
//       ),
//     );
//   }
// }

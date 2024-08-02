// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
// import 'package:project1/screen/home_screen.dart';
//
// class OtpScreen extends StatefulWidget {
//   String verificationid;
//    OtpScreen({required this.verificationid,super.key});
//
//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   TextEditingController otpController = TextEditingController();
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
//               colors: [
//                 Colors.redAccent.shade100,
//                 Colors.pinkAccent.shade100,
//                 Colors.yellowAccent.shade100,
//               ],
//               begin: Alignment.bottomLeft,
//               end: Alignment.bottomRight,
//             )),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 110, top: 40),
//             child: Text(
//               "OTP Screen",
//               style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 150, right: 150),
//                 child: Text(
//                   "verification code",
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 100),
//                 child: Text(
//                   "We Have send Verification Code",
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 235),
//                 child: Text(
//                   "+91******8990",
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: otpController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                       hintText: "Enter otp",
//                       suffixIcon: Icon(FontAwesomeIcons.phone),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       )),
//                 ),
//               ),
//               SizedBox(height: 20,),
//               ElevatedButton(onPressed: ()async{
//                 try{
//                   PhoneAuthCredential credential=
//                       await PhoneAuthProvider.credential(verificationId: widget.verificationid,
//                           smsCode: otpController.text.toString());
//                   FirebaseAuth.instance.signInWithCredential(credential).then((value) {
//                     Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
//                   });
//                 }catch(e){
//                   print(e.toString());
//
//                 }
//               }, child: Text("verify"),),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

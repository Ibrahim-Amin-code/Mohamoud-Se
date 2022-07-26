// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:nib_app/screens/Authnitication/auth.dart';
// import 'package:nib_app/screens/components/constants.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class PinCodeVerificationScreen extends StatefulWidget {
//   final String? phoneNumber;
//   final String verificationId;
//   const PinCodeVerificationScreen({
//     Key? key,
//     required this.phoneNumber,
//     required this.verificationId,
//   }) : super(key: key);

//   @override
//   _PinCodeVerificationScreenState createState() =>
//       _PinCodeVerificationScreenState();
// }

// class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
//   StreamController<ErrorAnimationType>? errorController;

//   bool hasError = false;
//   String currentText = "";

//   var phoneController = TextEditingController();
//   var onTapRecognizer;
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   final formKey = GlobalKey<FormState>();

//   void signInWithPhoneNumber() async {
//     FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: phoneController.text,
//       );
//       final User? user =
//           (await firebaseAuth.signInWithCredential(credential)).user;
//       if (user!.uid != '' || user.uid != null) {
//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (context) => AuthniticationScreen()),
//             (route) => false);
//         //
//         // Navigator.push(context,
//         //     MaterialPageRoute(builder: (context) => AuthniticationScreen()));

//       }
//       print("Successfully signed in UID: ${user.uid}");
//     } catch (e) {
//       print("Failed to sign in: " + e.toString());
//     }
//   }

//   @override
//   void initState() {
//     onTapRecognizer = TapGestureRecognizer()
//       ..onTap = () {
//         Navigator.pop(context);
//       };
//     errorController = StreamController<ErrorAnimationType>();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     errorController!.close();
//     super.dispose();
//   }

//   // snackBar Widget
//   snackBar(String? message) {
//     return ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message!),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       // backgroundColor: Constants.PRIMARY_COLOR,
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: ListView(
//           children: <Widget>[
//             SizedBox(height: 100),
//             SizedBox(height: 8),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Text(
//                 'Phone Number Verification',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 22,
//                     fontFamily: 'Cairo'),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
//               child: RichText(
//                 text: TextSpan(
//                     text: "Enter the code sent to ",
//                     children: [
//                       TextSpan(
//                           text: widget.phoneNumber,
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Cairo',
//                               fontSize: 15)),
//                     ],
//                     style: TextStyle(
//                         color: Colors.black54,
//                         fontSize: 15,
//                         fontFamily: 'Cairo')),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Form(
//               key: formKey,
//               child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
//                   child: PinCodeTextField(
//                     appContext: context,
//                     pastedTextStyle: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     length: 6,
//                     obscureText: true,
//                     obscuringCharacter: '*',
//                     blinkWhenObscuring: true,
//                     animationType: AnimationType.fade,
//                     validator: (v) {
//                       if (v!.length < 3) {
//                         return "I'm from validator";
//                       } else {
//                         return null;
//                       }
//                     },
//                     pinTheme: PinTheme(
//                       errorBorderColor: Colors.white,
//                       activeColor: Colors.white,
//                       selectedColor: Colors.white,
//                       inactiveColor: Colors.white,
//                       inactiveFillColor: Colors.white,
//                       selectedFillColor: Colors.white,
//                       shape: PinCodeFieldShape.box,
//                       borderRadius: BorderRadius.circular(5),
//                       fieldHeight: 50,
//                       fieldWidth: 40,
//                       activeFillColor: Colors.white,
//                     ),
//                     cursorColor: Colors.black,
//                     animationDuration: Duration(milliseconds: 300),
//                     enableActiveFill: true,
//                     errorAnimationController: errorController,
//                     controller: phoneController,
//                     keyboardType: TextInputType.number,
//                     boxShadows: [
//                       BoxShadow(
//                         offset: Offset(0, 1),
//                         color: Colors.black12,
//                         blurRadius: 10,
//                       )
//                     ],
//                     onCompleted: (v) {
//                       print("Completed");
//                     },
//                     onChanged: (value) {
//                       print('vallllllllllllllll--------------- $value');
//                       setState(() {
//                         currentText = value;
//                       });
//                     },
//                     beforeTextPaste: (text) {
//                       print("Allowing to paste $text");
//                       //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//                       //but you can show anything you want here, like your pop up saying wrong paste format or etc
//                       return true;
//                     },
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30.0),
//               child: Text(
//                 hasError ? "*Please fill up all the cells properly" : "",
//                 style: TextStyle(
//                     color: Colors.red,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Didn't receive the code? ",
//                   style: TextStyle(
//                       color: Colors.black54, fontSize: 15, fontFamily: 'Cairo'),
//                 ),
//                 TextButton(
//                     onPressed: () => snackBar("OTP resend!!"),
//                     child: Text(
//                       "RESEND",
//                       style: TextStyle(
//                           color: HexColor('#2972B7'),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                           fontFamily: 'Cairo'),
//                     ))
//               ],
//             ),
//             SizedBox(
//               height: 14,
//             ),
//             Container(
//               margin:
//                   const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
//               child: ButtonTheme(
//                 height: 50,
//                 child: TextButton(
//                   onPressed: () {
//                     if (formKey.currentState!.validate()) {
//                       signInWithPhoneNumber();
//                     }
//                     // conditions for validating
//                     if (currentText.length == 6) {
//                       errorController!.add(ErrorAnimationType
//                           .shake); // Triggering error shake animation
//                       setState(() {
//                         hasError = true;
//                       });
//                     } else {
//                       setState(() {
//                         hasError = false;
//                         scaffoldKey.currentState!.showSnackBar(SnackBar(
//                           content: Text("Aye!!"),
//                           duration: Duration(seconds: 2),
//                         ));
//                       });
//                     }
//                   },
//                   // widget.press,
//                   child: Center(
//                       child: Text(
//                     "VERIFY".toUpperCase(),
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Cairo'),
//                   )),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: HexColor('#2972B7'),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

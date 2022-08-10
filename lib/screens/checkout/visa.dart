// // ignore_for_file: avoid_print, use_key_in_widget_constructors

// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:my_fatoorah/my_fatoorah.dart';
// import 'package:nib_app/generated/locale_keys.dart';
// import 'package:nib_app/screens/my_orders/orderSuccess/orderSuccess.dart';

// String mAPIKey =
//     'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';

// class VisaScreen extends StatefulWidget {
//   // final String totalPrice;
//   // final String orderId;

//   // const VisaScreen(
//   //     {Key? key, required this.totalPrice,})
//   //     : super(key: key);
//   @override
//   _VisaScreenState createState() => _VisaScreenState();
// }

// class _VisaScreenState extends State<VisaScreen> {
//   String lang = '';
//   String token = '';
//   bool islogin = false;
//   // getLang() async {
//   //   SharedPreferences preferences = await SharedPreferences.getInstance();
//   //   setState(() {
//   //     lang = preferences.getString('language').toString();
//   //     lang = preferences.getString('token') ?? '';
//   //     islogin = preferences.getBool('login') ?? false;
//   //   });
//   // }

//   @override
//   void initState() {
//     // getLang();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           LocaleKeys.Check_Out.tr(),
//           style: TextStyle(
//               fontSize: w * 0.05,
//               fontFamily: 'OpenSans',
//               color: Colors.black,
//               fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         leading: BackButton(
//           color: Colors.black,
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: MyFatoorah(
//         afterPaymentBehaviour: AfterPaymentBehaviour.AfterCallbackExecution,
//         buildAppBar: (context) {
//           return AppBar(
//             backgroundColor: Colors.white,
//             title: Text(
//               LocaleKeys.Check_Out.tr(),
//               style: TextStyle(
//                   fontSize: w * 0.05,
//                   fontFamily: 'OpenSans',
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//             leading: BackButton(
//               color: Colors.black,
//               onPressed: () => Navigator.pop(context),
//             ),
//             centerTitle: true,
//             elevation: 0,
//           );
//         },
//         onResult: (res) async {
//           if (res.isSuccess) {
//             Navigator.pushReplacement(context,
//                 MaterialPageRoute(builder: (context) => OrderSuccessScreen()));
//           }
//           if (res.isError) {
//             print("error url : ---------" + res.url.toString());
//             Navigator.pop(context);
//           } else if (res.isNothing) {
//             print("no thing url : ---------" + res.url.toString());
//             Navigator.pop(context);
//           }
//         },
//         request: MyfatoorahRequest.test(
//           token: mAPIKey,
//           language: ApiLanguage.Arabic,
//           invoiceAmount: 200,
//           successUrl:
//               "https://images-eu.ssl-images-amazon.com/images/G/31/img16/GiftCards/payurl1/440x300-2.jpg",
//           errorUrl:
//               "https://st3.depositphotos.com/3000465/33237/v/380/depositphotos_332373348-stock-illustration-declined-payment-credit-card-vector.jpg?forcejpeg=true",
//           currencyIso: Country.Kuwait,
//         ),
//       ),
//     );
//   }
// }

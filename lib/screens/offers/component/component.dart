import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';

Widget buildOffersCard({
  // required String price,
  // required String newPrice,
  required String image,
  context,
}) =>
    Container(
      height: 200,
      width: double.infinity,
      color: HexColor('#FFFFFF'),
      child: customCachedNetworkImage(
        url: image,
        context: context,
        fit: BoxFit.fill,
      ),
      //  Row(
      //   children: [
      //     Container(
      //       color: HexColor('#AA1050'),
      //       child: Padding(
      //         padding: const EdgeInsets.only(
      //           left: 10,
      //           top: 8,
      //           right: 4,
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               LocaleKeys.Sale_Off.tr(),
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.w600,
      //                   color: HexColor('#FFFFFF'),
      //                   fontFamily: 'OpenSans'),
      //             ),
      //             SizedBox(
      //               height: 5,
      //             ),
      //             Text(
      //               '${LocaleKeys.Price.tr()}:  $price | ${LocaleKeys.New_Price.tr()}: $newPrice   ',
      //               style: TextStyle(
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.bold,
      //                 color: HexColor('#FFFFFF'),
      //                 fontFamily: 'OpenSans',
      //               ),
      //             ),
      //             SizedBox(
      //               height: 5,
      //             ),
      //             Text(
      //               LocaleKeys.All_Products.tr(),
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.w600,
      //                   color: HexColor('#FFFFFF'),
      //                   fontFamily: 'OpenSans'),
      //             ), // SizedBox( height: 5,),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Spacer(),
      // Container(
      //   width: 150,
      //   child: customCachedNetworkImage(
      //     url: image,
      //     context: context,
      //     fit: BoxFit.contain,
      //   ),
      // ),
      //   ],
      // ),
    );

Widget buildOffersCardRow({
  // required String price,
  // required String newPrice,
  required String image,
  // required String title,
  context,
}) =>
    Container(
      // height: 22.h,
      width: 150,
      decoration: BoxDecoration(
        color: HexColor('#4CB8BA'),
      ),
      child: customCachedNetworkImage(
          url: image, context: context, fit: BoxFit.cover),
      // width: 150,
      // child: Stack(
      //   children: [
      //     Container(
      //       height: 22.h,
      //       child: customCachedNetworkImage(url: image, context: context, fit: BoxFit.cover),
      //     ),
      //       Padding(
      //         padding:  EdgeInsets.only(top: 23.h,left: 10,right: 12),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             // Text(title,
      //             //   maxLines: 1,
      //             //   overflow: TextOverflow.ellipsis,
      //             //   style: TextStyle(
      //             //   color: HexColor('FFFFFF'),
      //             //   fontSize: 14,
      //             //   fontWeight: FontWeight.w600,
      //             //   fontFamily: 'OpenSans'
      //             // ),),
      //             // SizedBox(height: 3,),
      //             // Text('${LocaleKeys.Price.tr()}:  ' + price,style: TextStyle(
      //             //     color: HexColor('FFFFFF'),
      //             //     fontSize: 14,
      //             //     fontWeight: FontWeight.w600,
      //             //     fontFamily: 'OpenSans'
      //             // ),),
      //             // // SizedBox(height: 2,),
      //             // Text('${LocaleKeys.New_Price.tr()}:  ' + newPrice,style: TextStyle(
      //                 color: HexColor('FFFFFF'),
      //                 fontSize: 14,
      //                 fontWeight: FontWeight.w600,
      //                 fontFamily: 'OpenSans'
      //             ),),
      //             // SizedBox(height: 3,),
      //           ],
      //         ),
    );

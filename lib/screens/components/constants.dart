import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:nib_app/screens/components/size_config.dart';
import 'package:sizer/sizer.dart';

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const defaultDuration = Duration(milliseconds: 250);

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    // borderSide: BorderSide(color: kTextColor),
  );
}

spaceH(double height) {
  return SizedBox(height: height);
}

spaceW(double width) {
  return SizedBox(width: width);
}

////////////////////////
homeBottomSheet({context, child}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    // ignore: prefer_const_constructors
    shape: RoundedRectangleBorder(
      // ignore: prefer_const_constructors
      borderRadius: BorderRadius.only(
          topRight: const Radius.circular(30),
          topLeft: const Radius.circular(30)),
    ),
    isDismissible: true,
    context: context,
    builder: (context) =>
        Padding(padding: MediaQuery.of(context).viewInsets, child: child),
  );
}

// ///////////////////////////////////////////////////////////////////////////////

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Future<void> showMyDialog(
    {required BuildContext context,
    required String title,
    required Widget data}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        title: data,
      );
    },
  );
}
//////////////////////////////////////////////////////////////////////////////////////////

customAppbar({required String title, required context}) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, 60),
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [HexColor("#40A2A6"), HexColor("#4CB8BA")])),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title,
              style: headingStyle.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    ),
  );
}
//////////////////////////////////////////////////////////////////////////////////

customTextField(
    {required String title,
    required TextEditingController controller,
    required TextInputType type,
    required bool secure}) {
  return TextFormField(
    keyboardType: type,
    controller: controller,
    obscureText: secure,
    decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: title,
        hintStyle: headingStyle.copyWith(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: HexColor("#C9C9C9")),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: HexColor("#7070704D")))),
  );
}

//////////////////////////////////////////////////////////////////////////////////////
headerText({required String title}) {
  return Text(
    title,
    style: headingStyle.copyWith(
        color: HexColor("#2D2D2D"),
        fontWeight: FontWeight.w700,
        fontSize: 13.sp),
  );
}
/////////////////////////////////////////////////////////////////////////////////

multilineTextField(
    {required String title,
    required TextEditingController controller,
    required TextInputType type,
    required bool secure}) {
  return TextFormField(
    keyboardType: type,
    controller: controller,
    obscureText: secure,
    maxLines: 5,
    decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: title,
        hintStyle: headingStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: HexColor("#C9C9C9")),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: HexColor("#7070704D")))),
  );
}

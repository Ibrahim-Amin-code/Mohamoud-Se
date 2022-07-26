import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:nib_app/screens/layout/layout_screen.dart';
import 'package:nib_app/screens/menu_screens/profile/get_profile_cubit/cubit.dart';
import 'package:nib_app/screens/menu_screens/profile/update_profile_cubit/update_profile_states.dart';
import 'package:nib_app/screens/menu_screens/profile/update_profile_cubit/update_profle_cubit.dart';
import 'package:nib_app/screens/more/more_screen.dart';
import 'package:easy_localization/easy_localization.dart';

Widget buildEditProfileCard({
  required String title,
  required String pathImage,
}) =>
    Container(
      padding: EdgeInsets.only(left: 30),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(pathImage),
          SizedBox(
            width: 30,
          ),
          Text(
            title,
            style: TextStyle(
              color: HexColor('#333333'),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );

buildEditProfileBottomSheet({
  required context,
  required String name,
  required String mobile,
}) {
  var usernameController = TextEditingController();
  var mobileController = TextEditingController();
  // var emailController = TextEditingController();
  return showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      builder: (context) {
        return BlocConsumer<UpdateProfileCubit, UpdateProfileStates>(
          listener: (context, state) {
            if (state is UpdateProfiledSuccessState) {
              if (UpdateProfileCubit.get(context).data['status'] == true) {
                Fluttertoast.showToast(
                    msg: UpdateProfileCubit.get(context).data['msg'].toString(),
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LayoutScreen(index: 4)),
                    (route) => false);
              } else {
                Fluttertoast.showToast(
                    msg: UpdateProfileCubit.get(context).data['msg'].toString(),
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }
          },
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor('#F5F6F8'),
              ),
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  primary: true,
                  shrinkWrap: true,
                  children: [
                    Text(
                      LocaleKeys.Username.tr(),
                      style: TextStyle(
                          fontSize: 14,
                          color: HexColor('#333333'),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: HexColor('#4CB8BA'))),
                      child: Center(
                        child: textFormField(
                          maxLines: 2,
                          hintText: name,
                          controller: usernameController,
                          type: TextInputType.text,
                          labelText: '',
                          context: context,
                          obscureText: false,
                          validator: (vla) {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      LocaleKeys.Phone.tr(),
                      style: TextStyle(
                          fontSize: 14,
                          color: HexColor('#333333'),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: HexColor('#4CB8BA'))),
                      child: Center(
                        child: textFormField(
                          maxLines: 2,
                          hintText: mobile,
                          controller: mobileController,
                          type: TextInputType.phone,
                          labelText: '',
                          context: context,
                          obscureText: false,
                          validator: (vla) {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        UpdateProfileCubit.get(context).updateProfile(
                            name: usernameController.text,
                            mobile: mobileController.text);
                      },
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 100),
                          height: 45,
                          decoration: BoxDecoration(
                            color: HexColor('#AA1050'),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Text(
                              LocaleKeys.Send.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            );
          },
        );
      });
}

Widget textFormField({
  context,
  required String hintText,
  required String labelText,
  required TextEditingController controller,
  required TextInputType type,
  int? maxLines,
  FormFieldValidator<String>? validator,
  required bool obscureText,
}) =>
    TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: type,
        maxLines: maxLines,
        obscureText: obscureText,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 14,
              color: HexColor('#333333'),
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans'),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#E6E6E6")),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#E6E6E6")),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#E6E6E6")),
          ),
        ));

////////////////////////////////////////////////////////////

// String parseHtmlString(String htmlString) {
//   final document = parse(htmlString);
//   final String parsedString = parse(document.body!.text).documentElement!.text;
//   return parsedString;
// }

/////////////////////////////////////////////////////////////////
customCachedNetworkImage({
  required String url,
  required context,
  required BoxFit fit,
}) {
  try {
    // ignore: unnecessary_null_comparison
    if (url == null || url == "") {
      return Container(
        child: Icon(
          Icons.error_outline,
          color: HexColor("#AB0D03"),
        ),
      );
    } else {
      return Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: (Uri.parse(url).isAbsolute)
            ? CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) {
                  return Icon(Icons.error_outline, color: HexColor("#AB0D03"));
                })
            : Icon(Icons.error_outline, color: HexColor("#AB0D03")),
      );
    }
  } catch (e) {
    print(e.toString());
  }
}
///////////////////////////////////////////////////////////////////////////////////

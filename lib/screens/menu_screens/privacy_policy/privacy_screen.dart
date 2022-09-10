import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/screens/cart/componnent/constant.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  String lang = '';
  getLang() async {
    final String data = await CacheHelper.getData(key: 'lang');
    setState(() {
      lang = data;
    });
  }

  @override
  void initState() {
    this.getLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.7),
          child: Container(
            color: HexColor('#AA1050'),
            padding:
                EdgeInsets.only(top: 5.h, left: 5.w, bottom: 2.h, right: 5.w),
            child: Row(
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 25,
                    )),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  LocaleKeys.Privacy_Policy.tr(),
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! ContactInfoLoadingState,
            builder: (context) => ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  child: (lang == 'en')
                      ? Text(
                          parseHtmlString(
                            HomeCubit.get(context)
                                .contactModel
                                .data!
                                .privacyEn!,
                          ),
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 12.5.sp,
                              fontWeight: FontWeight.w600,
                              color: HexColor('#7E7E7E'),
                              fontFamily: 'OpenSans'),
                        )
                      : (lang == 'sw')
                          ? Text(
                              parseHtmlString(
                                HomeCubit.get(context)
                                    .contactModel
                                    .data!
                                    .privacyKr!,
                              ),
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor('#7E7E7E'),
                                  fontFamily: 'OpenSans'),
                            )
                          : Text(
                              parseHtmlString(
                                HomeCubit.get(context)
                                    .contactModel
                                    .data!
                                    .privacyAr!,
                              ),
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor('#7E7E7E'),
                                  fontFamily: 'OpenSans'),
                            ),
                ),
                // SizedBox(height: 10,),
              ],
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

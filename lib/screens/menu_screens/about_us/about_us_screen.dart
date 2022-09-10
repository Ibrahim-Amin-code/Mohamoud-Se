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

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
    void launchEmailSubmission() async {
      final Uri params = Uri(
        scheme: 'mailto',
        path: HomeCubit.get(context).contactModel.data!.email,
        // queryParameters: {
        //   'subject': 'Default Subject',
        //   'body': 'Default body'
        // }
      );
      String url = params.toString();
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    }

    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.4),
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
                  LocaleKeys.About_Us.tr(),
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
                Container(
                  height: 65.h,
                  // width: 340,
                  child: (lang == 'en')
                      ? Text(
                          parseHtmlString(HomeCubit.get(context)
                              .contactModel
                              .data!
                              .descriptionEn!),
                          style: TextStyle(
                              fontSize: 12.5.sp,
                              fontWeight: FontWeight.w600,
                              color: HexColor('#7E7E7E'),
                              fontFamily: 'OpenSans'),
                        )
                      : (lang == 'sw')
                          ? Text(
                              parseHtmlString(HomeCubit.get(context)
                                  .contactModel
                                  .data!
                                  .descriptionKr!),
                              style: TextStyle(
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor('#7E7E7E'),
                                  fontFamily: 'OpenSans'),
                            )
                          : Text(
                              parseHtmlString(HomeCubit.get(context)
                                  .contactModel
                                  .data!
                                  .descriptionAr!),
                              style: TextStyle(
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor('#7E7E7E'),
                                  fontFamily: 'OpenSans'),
                            ),
                ),
                Text(
                  LocaleKeys.Contact_Us.tr(),
                  style: TextStyle(
                      color: HexColor('#515C6F'),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 15.sp),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/facebook.png'),
                      Image.asset('assets/images/twitter.png'),
                      Image.asset('assets/images/instagram-sketched.png'),
                      InkWell(
                          onTap: () {
                            launchEmailSubmission();
                            print(HomeCubit.get(context)
                                .contactModel
                                .data!
                                .email);
                          },
                          child: Icon(Icons.email_outlined,
                              size: 55, color: Colors.blue.shade300)),
                      InkWell(
                          onTap: () async {
                            await launch(
                                "tel://${HomeCubit.get(context).contactModel.data!.phone}");
                            print(HomeCubit.get(context)
                                .contactModel
                                .data!
                                .phone);
                          },
                          child: Icon(
                            Icons.call_outlined,
                            size: 40,
                            color: Colors.green,
                          )),
                    ],
                  ),
                )
              ],
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

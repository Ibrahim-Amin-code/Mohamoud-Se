import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/screens/categories/categories_component/component.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nib_app/screens/splash/splashScreen.dart';
import 'package:sizer/sizer.dart';

import '../../home/home_cubit/home_cubit.dart';
import '../../home/home_cubit/states.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  LocaleKeys.Select_Language.tr(),
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
          return ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: Text(
                  LocaleKeys.Preferred_Language.tr(),
                  style: TextStyle(
                      fontSize: 19,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: Text(
                  LocaleKeys.your_language.tr(),
                  style: TextStyle(
                      fontSize: 19,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              myDivider(height: 2),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: CheckboxListTile(
                  activeColor: Colors.pink,
                  title: Text(
                    'اللغة العربية',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  value: HomeCubit.get(context).isLang2,
                  onChanged: (value) {
                    HomeCubit.get(context).changeAppLang2();
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Splash()),
                          (route) => false);
                      context.locale = Locale("ar");
                      CacheHelper.saveData(key: 'lang', value: "ar");
                    });
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              myDivider(height: 2),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: CheckboxListTile(
                  activeColor: Colors.pink,
                  title: Text(
                    'English Language',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  value: HomeCubit.get(context).isLang,
                  onChanged: (value) {
                    HomeCubit.get(context).changeAppLang();
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Splash()),
                          (route) => false);
                      context.locale = Locale("en");
                      CacheHelper.saveData(key: 'lang', value: "en");
                    });
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              myDivider(height: 2),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: CheckboxListTile(
                  activeColor: Colors.pink,
                  title: Text(
                    'Swedish Language',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  value: HomeCubit.get(context).isLang3,
                  onChanged: (value) {
                    HomeCubit.get(context).changeAppLang3();
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Splash()),
                          (route) => false);
                      context.locale = Locale("sw");
                      CacheHelper.saveData(key: 'lang', value: "sw");
                    });
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              myDivider(height: 2),
            ],
          );
        },
        // child: ,
      ),
    );
  }
}

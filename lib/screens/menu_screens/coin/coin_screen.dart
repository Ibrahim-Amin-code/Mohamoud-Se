import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/main.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/screens/categories/categories_component/component.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nib_app/screens/splash/splashScreen.dart';
import 'package:sizer/sizer.dart';

import '../../home/home_cubit/home_cubit.dart';
import '../../home/home_cubit/states.dart';

class CoinScreen extends StatefulWidget {
  @override
  _CoinScreenState createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
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
                  LocaleKeys.coin.tr(),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: CheckboxListTile(
                  activeColor: Colors.pink,
                  title: Text(
                    'Dollar',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  value: HomeCubit.get(context).isDollar,
                  onChanged: (value) {
                    HomeCubit.get(context).changeToDollar();
                    setState(() {
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => Splash()),
                      //     (route) => false);
                      // context.locale = Locale("en");
                      prefs.setString("price_k", "\$");
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
                    'Kron',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  value: HomeCubit.get(context).isKron,
                  onChanged: (value) {
                    HomeCubit.get(context).changeToKron();
                    setState(() {
                      prefs.setString('price_k', 'kir');
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

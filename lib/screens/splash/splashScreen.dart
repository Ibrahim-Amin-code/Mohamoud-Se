import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nib_app/screens/Authnitication/auth.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'body.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  // Widget screen = LoginOrSignupScreen();
  // void getScreen()async{
  //   bool isLogin = await CacheHelper.getData(key: 'isLogin');
  //   if(isLogin == true)
  //   {
  //     setState(() {
  //       screen = LayoutScreen(index: 0);
  //     });
  //   }else{
  //     setState(() {
  //       screen = LoginOrSignupScreen();
  //     });
  //   }
  // }

  void initState() {
    // HomeCubit.get(context).getAllProducts();
    HomeCubit.get(context).getProducts(id: '', brandId: '');
    HomeCubit.get(context).getCategories();
    HomeCubit.get(context).getShops();
    HomeCubit.get(context).getBanners();
    HomeCubit().getAllOffers();
    // HomeCubit.get(context).getProductDetails( id: '');
    HomeCubit.get(context).contactInfo();
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => AuthniticationScreen())));
    // getScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#AA1050'),
        // shape: BoxShape.circle,
        // gradient: LinearGradient(
        //     colors: [HexColor('#40A2A6'), HexColor('#4CB8BA')])
      ),
      child: Scaffold(
        backgroundColor: HexColor('#00000000'),
        appBar: AppBar(
          // backgroundColor:HexColor('#3b5998'),
          toolbarHeight: 0,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: SplashBody(),
      ),
    );
  }
}

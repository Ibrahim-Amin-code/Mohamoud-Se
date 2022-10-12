import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/screens/Authnitication/forgetPassword/cubit/cubit.dart';
import 'package:nib_app/screens/Authnitication/sign_in/login_cubit/cubit.dart';
import 'package:nib_app/screens/checkout/checkout_cubit/checkout_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/layout/cubit/cubit.dart';
import 'package:nib_app/screens/menu_screens/profile/update_profile_cubit/update_profle_cubit.dart';
import 'package:nib_app/screens/my_orders/cubit/cubit.dart';
import 'package:nib_app/screens/splash/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'generated/codegen_loader.dart';
import 'network/bloc_observer.dart';
import 'network/dio/dio_helper.dart';

//HexColor('#AA1050'),
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await startShared();
  Bloc.observer = MyBlocObserver();
  DioHelper.inti();

  // ignore: await_only_futures
  await CacheHelper();

  await startShared();

  runApp(EasyLocalization(
    supportedLocales: [Locale('en', ''), Locale('ar', ''), Locale('sw', '')],
    path: 'assets/translations', // <-- change the path of the translation files
    // fallbackLocale: Locale('en', ''),
    assetLoader: const CodegenLoader(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
// finish all address
// finish all App

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
            providers: [
              BlocProvider<AppCubit>(create: (context) => AppCubit()),
              BlocProvider<OrderCubit>(
                  create: (context) => OrderCubit()..getOrders()),
              BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
              BlocProvider<ForgetPasswordCubit>(
                  create: (context) => ForgetPasswordCubit()),
              BlocProvider<UpdateProfileCubit>(
                  create: (context) => UpdateProfileCubit()),
              BlocProvider<HomeCubit>(
                  create: (context) => HomeCubit()
                    ..getShops()
                    ..getCategories()
                    ..contactInfo()
                    ..getBanners()
                    ..getCard()
                    ..getProducts(id: '', brandId: '')
                    ..getWishList()
                    ..getAllOffers()
                    ..getReviews(id: '')
                    ..changeAppLang()
                    ..changeAppLang2()
                    ..changeAppLang3()),
              BlocProvider<CheckoutCubit>(
                  create: (context) => CheckoutCubit()..getAddresses()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              home: SafeArea(
                child: Splash(),
              ),
            ));
      },
    );
  }
}

late SharedPreferences prefs;
Future startShared() async {
  prefs = await SharedPreferences.getInstance();
}

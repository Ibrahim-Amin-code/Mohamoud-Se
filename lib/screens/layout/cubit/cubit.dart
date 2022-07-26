import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/screens/categories/categories_screen.dart';
import 'package:nib_app/screens/home/home_screen.dart';
import 'package:nib_app/screens/layout/cubit/states.dart';
import 'package:nib_app/screens/more/more_screen.dart';
import 'package:nib_app/screens/my_orders/my_orders_screen.dart';
import 'package:nib_app/screens/offers/offers_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  int? selectedItem;
  int? selectedCash;
  int? selectedVisa;

  void addressSelection({int? selected}) {
    selectedItem = selected;
    emit(SelectionAddressState());
  }

  void visaSelection({int? selected}) {
    selectedVisa = selected;
    emit(SelectionVisaState());
  }

  void cashSelection({int? selected}) {
    selectedCash = selected;
    emit(SelectionCashState());
  }

  List<Widget> screens = [
    CategoriesScreen(),
    OffersScreen(),
    HomeScreen(),
    MyOrdersScreen(),
    MoreScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }
  // bool isDark = false;
  // void changeAppMode({bool? fromShard}){
  //   if(fromShard != null) isDark = fromShard; else isDark = !isDark;
  //   CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value){
  //     emit(AppChangeModeState());
  //   });
  // }

  // Map<int,num> counter ={};
  var counter = Map<num, num>();

  void increaseQuantity({
    required int productId,
  }) {
    counter[productId] = 0;
    counter[productId] = (counter[productId]! + 1);
    emit(IncreaseQuantityState());
  }

  void decreaseQuantity({required int productId}) {
    counter[productId] = (counter[productId]! - 1);
    if (counter[productId]! < 1) {
      counter[productId] = 1;
    }

    emit(DecreaseQuantityState());
  }
}

import 'package:badges/badges.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/cart/cart.dart';
import 'package:nib_app/screens/categories/categories_component/component.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:nib_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nib_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';
import '../../../main.dart';
import 'component/wish_list_component.dart';
import 'package:easy_localization/easy_localization.dart';

class WishListScreen extends StatelessWidget {
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
                EdgeInsets.only(top: 4.h, left: 5.w, bottom: 2.h, right: 5.w),
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
                  LocaleKeys.Wish_List.tr(),
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: BlocConsumer<HomeCubit, HomeState>(
                        builder: (context, state) => Padding(
                              padding: const EdgeInsets.all(5),
                              child: Badge(
                                badgeColor: Colors.green,
                                child: InkWell(
                                  child: const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  focusColor: Colors.white,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CartScreen()));
                                  },
                                ),
                                animationDuration: const Duration(
                                  seconds: 2,
                                ),
                                badgeContent:
                                    (HomeCubit.get(context).cart.isNotEmpty)
                                        ? Text(
                                            HomeCubit.get(context)
                                                .cart
                                                .length
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          )
                                        : Text(
                                            "0",
                                            style: TextStyle(
                                              color: HexColor('#AA1050'),
                                              fontSize: 14,
                                            ),
                                          ),
                                position: BadgePosition.topStart(start: -8),
                              ),
                            ),
                        listener: (context, state) {})),
              ],
            ),
          )),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            children: [
              // (HomeCubit.get(context).wishListModel.data.isNotEmpty)?
              ConditionalBuilder(
                condition: state is! GetWishListLoadingState,
                builder: (context) => GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.h,
                  crossAxisSpacing: 1.5.w,
                  childAspectRatio: 1 / 1.55,
                  children: List.generate(
                      //var len = foo?.length ??
                      HomeCubit.get(context).wish.length,
                      (index) => InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                          details: HomeCubit.get(context)
                                              .wishListModel
                                              .data![index],
                                        ))),
                            child: SizedBox(
                              height: 41.h,
                              child: buildWishListProductsItem(
                                id: HomeCubit.get(context)
                                    .wish[index]['id']
                                    .toString(),
                                context: context,
                                onTap: () => HomeCubit.get(context)
                                    .addToWishList(
                                        id: HomeCubit.get(context)
                                            .wish[index]['id']
                                            .toString()),
                                name: HomeCubit.get(context)
                                    .wish[index]['name']
                                    .toString(),
                                image: HomeCubit.get(context)
                                    .wish[index]['cover_img']
                                    .toString(),
                                price: (prefs.getString('price_k') == 'kr')
                                    ? HomeCubit.get(context)
                                        .wish[index]['price_k']
                                        .toString()
                                    : HomeCubit.get(context)
                                        .wish[index]['price']
                                        .toString(),
                              ),
                            ),
                          )),
                ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          );
        },
      ),
    );
  }
}

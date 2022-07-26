import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:nib_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:easy_localization/easy_localization.dart';

import 'component/component.dart';

class OffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.4),
          child: Container(
            color: HexColor('#AA1050'),
            // color: Colors.orange,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 4.h, bottom: 2.h),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/offers.png',
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    LocaleKeys.Offers.tr(),
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! AllOffersLoadingState,
            builder: (context) => ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              physics: BouncingScrollPhysics(),
              primary: true,
              shrinkWrap: true,
              // padding: EdgeInsets.symmetric(vertical: 10,),
              children: [
                ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                      details: HomeCubit.get(context)
                                          .allOffersModel
                                          .data![index])));
                        },
                        child: buildOffersCard(
                          image: HomeCubit.get(context)
                              .allOffersModel
                              .data![index]
                              .offer!
                              .image
                              .toString(),
                          // price: HomeCubit.get(context)
                          //     .allOffersModel
                          //     .data![index]
                          //     .price
                          //     .toString(),
                          // newPrice: HomeCubit.get(context)
                          //     .allOffersModel
                          //     .data![index]
                          //     .offer!
                          //     .price
                          //     .toString(),
                          context: context,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount:
                        HomeCubit.get(context).allOffersModel.data!.length),
              ],
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
            // child:
          );
        },
      ),
    );
  }
}

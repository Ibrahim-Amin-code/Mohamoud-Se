import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nib_app/screens/see_all/sell_all_screen.dart';

import '../search_class.dart';
import 'categories_component/component.dart';
import 'package:sizer/sizer.dart';

import 'category_search_class.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.4),
          child: Container(
            // margin: EdgeInsets.only(top: 5),
            padding:
                EdgeInsets.only(top: 3.h, left: 5.w, bottom: 3.h, right: 3.w),
            decoration: BoxDecoration(
              color: HexColor('#AA1050'),
              // gradient: LinearGradient(
              //     colors: [HexColor('#40A2A6'), HexColor('#4CB8BA')])
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/categories.png',
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  LocaleKeys.Categories.tr(),
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(
              vertical: 3.h,
            ),
            children: [
              InkWell(
                  onTap: () {
                    showSearch(context: context, delegate: CategorySearch());
                  },
                  child: buildSearchCardInCategoriesScreen()),
              SizedBox(
                height: 3.h,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: 305,
                child: ConditionalBuilder(
                  condition: state is! CategoriesLoadingState,
                  builder: (context) => ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              HomeCubit.get(context).getProducts(
                                  brandId: '',
                                  id: HomeCubit.get(context)
                                      .categories[index]['id']
                                      .toString());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SeeAllScreen()));
                            },
                            child: buildCategoriesCard(
                                title: HomeCubit.get(context).categories[index]
                                    ['title']),
                          ),
                      separatorBuilder: (context, index) => Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              myDivider(height: 2),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                      itemCount: HomeCubit.get(context).categories.length),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                  // child: ,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

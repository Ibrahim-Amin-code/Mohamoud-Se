import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/screens/filtter/filtter_class.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:nib_app/screens/product_detail/product_detail_screen.dart';
import '../../main.dart';
import 'component/compoenet.dart';
import 'package:sizer/sizer.dart';

class SeeAllScreen extends StatefulWidget {
  @override
  _SeeAllScreenState createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: buildEndDrawer(),
      key: scaffoldKey,
      backgroundColor: HexColor('#F5F6F8'),
      appBar: buildSearchCardInSeeAllScreen(context),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! ProductsLoadingState,
            builder: (context) => ListView(
              children: [
                // Container(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 5.w,
                //   ),
                //   height: 7.h,
                //   color: HexColor('#212224'),
                //   child: Row(
                //     children: [
                //       Image.asset('assets/images/Group 202.png'),
                //       SizedBox(
                //         width: 4.w,
                //       ),
                //       Image.asset('assets/images/Group 203.png'),
                //       Spacer(),
                //       InkWell(
                //           onTap: () {
                //             scaffoldKey.currentState!.openEndDrawer();
                //           },
                //           child: Image.asset('assets/images/filter.png')),
                //     ],
                //   ),
                // ),

                SizedBox(
                  height: 10,
                ),
                GridView.count(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 2.5.w,
                  crossAxisSpacing: 2.h,
                  childAspectRatio: 1 / 1.60,
                  children: List.generate(
                      HomeCubit.get(context).getProductsModel.data!.length,
                      (index) => InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                          details: HomeCubit.get(context)
                                              .getProductsModel
                                              .data![index],
                                        ))),
                            child: buildSeeAllProductsItem(
                              id: HomeCubit.get(context)
                                  .getProductsModel
                                  .data![index]
                                  .id
                                  .toString(),
                              context: context,
                              name: HomeCubit.get(context)
                                  .getProductsModel
                                  .data![index]
                                  .name
                                  .toString(),
                              image: HomeCubit.get(context)
                                  .getProductsModel
                                  .data![index]
                                  .coverImg
                                  .toString(),
                              price: (prefs.getString('price_k') == 'kr')
                                  ? HomeCubit.get(context)
                                      .getProductsModel
                                      .data![index]
                                      .priceK
                                      .toString()
                                  : HomeCubit.get(context)
                                      .getProductsModel
                                      .data![index]
                                      .priceK
                                      .toString(),
                            ),
                          )),
                ),
              ],
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

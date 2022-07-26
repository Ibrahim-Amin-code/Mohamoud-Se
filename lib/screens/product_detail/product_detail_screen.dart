import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/main.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/screens/cart/cart.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nib_app/screens/product_detail/product_detail_component/product_description.dart';
import 'package:nib_app/screens/product_detail/product_detail_component/product_detail_component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import '../home/home_cubit/states.dart';

class ProductDetailsScreen extends StatefulWidget {
  final dynamic details;

  ProductDetailsScreen({Key? key, required this.details}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      HexColor('#000000'),
      HexColor('#B5994565'),
      HexColor('#727C8E'),
      HexColor('#ED5199'),
      HexColor('#515C6F'),
      HexColor('#FF8C69'),
      HexColor('#4CB8BA'),
      HexColor('#FF9000')
    ];

    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('#F5F6F8'),
        leading: Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: HexColor('#4CB8BA'),
                size: 25,
              )),
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen())),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: BlocConsumer<HomeCubit, HomeState>(
                    builder: (context, state) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Badge(
                            badgeColor: Colors.green,
                            child: InkWell(
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: HexColor('#AA1050'),
                                size: 25,
                              ),
                              focusColor: Colors.red,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartScreen()));
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
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
        ),
        primary: true,
        shrinkWrap: true,
        children: [
          (widget.details.productImage.isNotEmpty)
              ? CarouselSlider.builder(
                  itemCount: widget.details.productImage.length,
                  itemBuilder: (context, index, pageViewIndex) {
                    return Container(
                      child: customCachedNetworkImage(
                          url: widget.details.productImage[index].image,
                          context: context,
                          fit: BoxFit.contain),
                    );
                  },
                  options: CarouselOptions(
                    height: 250,
                    initialPage: 0,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    aspectRatio: 3,
                  ),
                )
              : Container(),

          SizedBox(
            height: 3.h,
          ),
          Text(
            widget.details.name,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: HexColor('#515C6F'),
                fontFamily: 'OpenSan'),
          ),
          SizedBox(
            height: 1.h,
          ),
          buildRatingBarRow(context: context, id: widget.details.id.toString()),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.Brands.tr() + ':',
                style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#515C6F'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Casio',
                style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#4CB8BA'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            LocaleKeys.Model_Number.tr() + ': ${widget.details.modalNumber}',
            //quantity
            style: TextStyle(
              fontSize: 16,
              color: HexColor('#515C6F'),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.Availability.tr() + ':',
                style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#515C6F'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.details.quantity.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#4CB8BA'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),

          buildAddToCartRow(
              context: context,
              price: (prefs.getString('price_k') == 'kir')
                  ? widget.details.priceK.toString()
                  : widget.details.price.toString(),
              quantity: counter,
              id: widget.details.id.toString()),

          //id: HomeCubit.get(context).getProductsModel.data![index].id.toString()
          SizedBox(
            height: 2.h,
          ),
          buildAddToWishListRow(
              context: context, id: widget.details.id.toString()),
          SizedBox(
            height: 4.h,
          ),
          Text(
            LocaleKeys.Select_Color.tr(),
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              color: HexColor('#515C6F'),
              fontSize: 10.sp,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          (widget.details.color != null)
              ? Container(
                  height: 10.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor(
                          widget.details.color[index].toString(),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 15,
                    ),
                    itemCount: (widget.details.color.length),
                  ),
                )
              : Container(),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'اختر الحجم',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              color: HexColor('#515C6F'),
              fontSize: 10.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 5.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                // height: 7.h,
                width: 11.w,
                child: Text(widget.details.size![index].toString()),
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
              itemCount: (widget.details.size.length),
            ),
          ),
          SizedBox(
              height: 45.h,
              child: ProductDescription(
                description: widget.details.description,
              )),
          // Row(
          //   children: [
          //     Text(
          //       'Similer Products',
          //       style: TextStyle(
          //           color: HexColor('#515C6F'),
          //           fontWeight: FontWeight.bold,
          //           fontFamily: 'OpenSans',
          //           fontSize: 12.sp),
          //     ),
          //     Spacer(),
          //     Row(
          //       children: [
          //         Icon(
          //           Icons.arrow_back_ios,
          //           color: HexColor('#515C6F'),
          //           size: 15,
          //         ),
          //         Icon(
          //           Icons.arrow_forward_ios,
          //           color: HexColor('#515C6F'),
          //           size: 15,
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 3.h,
          // ),
          // SizedBox(
          //   height: 41.h,
          //   child: ListView.separated(
          //       scrollDirection: Axis.horizontal,
          //       primary: true,
          //       shrinkWrap: true,
          //       itemBuilder: (context, index) => buildNationalDayProductsItem(
          //           image: 'assets/images/Image 32.png',
          //           context: context,
          //           name: ''),
          //       separatorBuilder: (context, index) => SizedBox(
          //             width: 2.w,
          //           ),
          //       itemCount: 5),
          // ),

          SizedBox(
            height: 3.h,
          ),
          buildSeeAllButton(),
          SizedBox(
            height: 3.h,
          ),
        ],
      ),
    );
  }

  Widget buildAddToWishListRow({
    context,
    required String id,
  }) =>
      Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                counter--;
              });
              if (counter <= 1) {
                setState(() {
                  counter = 1;
                });
              }
            },
            child: CircleAvatar(
              backgroundColor: HexColor('#5A5A5A'),
              radius: 20,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Icon(
                  Icons.minimize,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          Text(
            '$counter',
            style: TextStyle(
              fontSize: 22,
              color: HexColor('#6A6A69'),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          InkWell(
            onTap: () {
              if (counter < num.parse(widget.details.quantity)) {
                setState(() {
                  counter++;
                });
              } else {
                setState(() {
                  counter = counter;
                });
              }
            },
            child: CircleAvatar(
              backgroundColor: HexColor('#5A5A5A'),
              radius: 20,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          InkWell(
              onTap: () {
                HomeCubit.get(context).addToWishList(id: id);
              },
              child:
                  // (widget.details.wishlist == false)?
                  buildAddToCartAndWishListContainer(
                      title: LocaleKeys.ADD_WISH.tr(), productId: id)
              // : SizedBox()
              ),
        ],
      );
}

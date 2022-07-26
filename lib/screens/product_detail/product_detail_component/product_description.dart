import 'package:flutter/material.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:sizer/sizer.dart';

// ignore: use_key_in_widget_constructors
class ProductDescription extends StatefulWidget {
  final String description;
  ProductDescription({required this.description});
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  List<String> text = [
    "Description",
    "Specification",
    "Additional Info",
  ];
  late PageController pageController;

  // bool isTapped = true;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Center(
        child: Text(widget.description),
      ),
      Column(
        children: [
          detailItem(color: "#FFFFFF", txt1: "Department", txt2: "Men"),
          detailItem(color: "#F5F6F8", txt1: "Band Coluor", txt2: "Sliver"),
          detailItem(color: "#FFFFFF", txt1: "Display type", txt2: "Abalog"),
          detailItem(
              color: "#F5F6F8", txt1: "Band colousre", txt2: "Buckle / clasp"),
          detailItem(color: "#FFFFFF", txt1: "Bnad Material", txt2: "Stanless"),
          detailItem(
              color: "#F5F6F8", txt1: "Model number", txt2: "LTP-1274D-7ADF"),
        ],
      ),
      const Center(
        child: Text("Information"),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:
              List.generate(text.length, (index) => buildDot(index: index)),
        ),
        spaceH(20),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 35.h,
          // color: Colors.red,
          child: PageView.builder(
              itemCount: text.length,
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return screens[index];
              }),
        ),
      ],
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6.h,
      width: currentIndex == index ? 29.w : 29.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:
              currentIndex == index ? HexColor('#AA1050') : Colors.transparent),
      child: InkWell(
          onTap: () {
            pageController.animateToPage(index,
                duration: const Duration(microseconds: 500),
                curve: Curves.fastOutSlowIn);
          },
          child: Center(
            child: Text(text[index],
                style: headingStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: (currentIndex == index)
                        ? Colors.white
                        : HexColor("#171717"))),
          )),
    );
  }

  detailItem(
      {required String color, required String txt1, required String txt2}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 1.5.w),
      decoration: BoxDecoration(
          color: HexColor(color), borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt1,
            style: headingStyle.copyWith(
              color: HexColor("#171717"),
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            txt2,
            style: headingStyle.copyWith(
              color: HexColor("#726D6D"),
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

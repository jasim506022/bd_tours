import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../const/const.dart';
import '../../../model/tourmodel.dart';
import 'widget/near_tour_widget.dart';
import 'widget/popular_tour_widget.dart';
import 'widget/cateory_widget.dart';
import 'widget/rowwidget.dart';

class ToursTabBarViewWidget extends StatefulWidget {
  const ToursTabBarViewWidget({
    super.key,
  });

  @override
  State<ToursTabBarViewWidget> createState() => _ToursTabBarViewWidgetState();
}

class _ToursTabBarViewWidgetState extends State<ToursTabBarViewWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Categories",
            style: GoogleFonts.poppins(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          // Categories List
          SizedBox(
            height: 55,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: travelCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    currentIndex = index;
                    setState(() {});
                  },
                  child:
                      CategoryWidget(currentIndex: currentIndex, index: index),
                );
              },
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          //Row Widget
          RowWidget(
            title: "Nearby Tours",
            function: () {},
          ),

          const SizedBox(
            height: 10,
          ),

          SizedBox(
              height: 222,
              width: double.infinity,
              child: ListView.builder(
                itemCount: tourList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: tourList[index],
                    child: const NearTourWidget(),
                  );
                },
              )),
          const SizedBox(
            height: 5,
          ),
          RowWidget(
            title: "Popular Designation",
            function: () {},
          ),

          const SizedBox(
            height: 5,
          ),
          SizedBox(
              height: 160,
              width: double.infinity,
              child: ListView.builder(
                itemCount: tourList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PopularTourWidget(
                    tourModel: tourList[index],
                  );
                },
              )),
        ],
      ),
    );
  }
}

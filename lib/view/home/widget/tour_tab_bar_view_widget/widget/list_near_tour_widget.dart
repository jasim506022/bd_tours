import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../controller/tour_controller.dart';
import '../../../../../loading_widget/loading_list_near_tour_widget.dart';
import '../../../../../widget/error_empty_widget.dart';
import 'near_by_tour_card.dart';
import 'tour_card.dart';

class ListNearTourWidget extends StatelessWidget {
  const ListNearTourWidget(
      {super.key, this.isVertical = false, this.isProfile = false});

  final bool isVertical;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    final tourController = Get.find<TourController>();
    return StreamBuilder(
      stream: tourController.tourSnapshot("All"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingListNearTourWidget(
            isVertical: isVertical,
          );
        }

        if (snapshot.hasError) {
          return ErrorEmptyWidget(
            title: 'Error: ${snapshot.error}',
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const ErrorEmptyWidget(
            title: 'No Tours available',
          );
        }

        if (snapshot.hasData) {
          var nearByTourList = tourController.filteredDocs(snapshot.data!.docs);

          return isVertical && isProfile
              ? ListView.separated(
                  scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: nearByTourList[index],
                      child: const NearbyTourCard(),
                    );
                  },
                  separatorBuilder: (context, index) => Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 25.w)),
                  itemCount: nearByTourList.length)
              : ListView.builder(
                  itemCount: nearByTourList.length,
                  scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: nearByTourList[index],
                      child: NearbyTourCard(),
                    );
                  },
                );
        }
        return LoadingListNearTourWidget(
          isVertical: isVertical,
        );
      },
    );
  }
}

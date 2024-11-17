import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../../controller/tour_controller.dart';

import '../../widget/error_empty_widget.dart';
import 'tour_agency_widget.dart';

class ListNearAgencyTourWidget extends StatelessWidget {
  const ListNearAgencyTourWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tourController = Get.find<TourController>();
    return SizedBox(
        height: 180.h,
        width: double.infinity,
        child: StreamBuilder(
          stream: tourController.tourSnapshot(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
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

            var nearByTourList =
            tourController.filteredDocs(snapshot.data!.docs);
            return ListView.builder(
              itemCount: nearByTourList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: nearByTourList[index],
                  child: const TourAgencyWidget(),
                );
              },
            );
          },
        ));
  }
}
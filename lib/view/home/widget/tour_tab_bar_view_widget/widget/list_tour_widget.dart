import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../controller/tour_controller.dart';
import '../../../../../loading_widget/loading_list_tour_widget.dart';
import '../../../../../model/tour_model.dart';
import '../../../../../widget/error_empty_widget.dart';
import 'tour_card.dart';

class ListTourWidget extends StatelessWidget {
  const ListTourWidget({
    super.key,
    this.isPopular = false,
    this.isScroll = true

  });

  final bool isPopular;
  final bool isScroll;


  @override
  Widget build(BuildContext context) {
    final tourController = Get.find<TourController>();
    return Obx(
      () => StreamBuilder(
        stream: isPopular
            ? tourController.popularTourSnapshot()
            : tourController.tourSnapshot(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingListTourWidget();
          }

          if (snapshot.hasError) {
            return Center(
              child: ErrorEmptyWidget(
                title: 'Error: ${snapshot.error}',
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: ErrorEmptyWidget(
                title: 'No Tours available',
              ),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: isPopular && !isScroll
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var tourModel =
                    TourModel.fromMap(snapshot.data!.docs[index].data());
                return ChangeNotifierProvider.value(
                  value: tourModel,
                  child: TourCard(),
                );
              },
            );
          }
          return const LoadingListTourWidget();
        },
      ),
    );
  }
}

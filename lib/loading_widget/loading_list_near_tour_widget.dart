import 'package:flutter/material.dart';

import 'loading_near_tour_widget.dart';

class LoadingListNearTourWidget extends StatelessWidget {
  const LoadingListNearTourWidget({
    super.key, required this.isVertical,
  });
  final bool isVertical;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
      itemCount: 8,
      itemBuilder: (context, index) {
        return const LoadingNearTourWidget();
      },
    );
  }
}
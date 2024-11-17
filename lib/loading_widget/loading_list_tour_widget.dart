import 'package:bd_tour_firebase/loading_widget/loading_tour_widget.dart';
import 'package:flutter/material.dart';

class LoadingListTourWidget extends StatelessWidget {
  const LoadingListTourWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const LoadingTourWidget();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controller/tour_controller.dart';
import '../../res/app_colors.dart';
import '../../model/tour_model.dart';

import '../../widget/error_empty_widget.dart';
import 'widget/book_now_widget.dart';
import 'widget/click_icon_widget.dart';
import 'widget/image_slider_widget.dart';
import 'widget/tour_detail_widget.dart';

class TourDetailsPage extends StatefulWidget {
  const TourDetailsPage({
    super.key,
  });

  @override
  State<TourDetailsPage> createState() => _TourDetailsPageState();
}

class _TourDetailsPageState extends State<TourDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late String id;

  @override
  void initState() {
    id = Get.arguments;
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final tourController = Get.find<TourController>();
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.lightwhite,
            resizeToAvoidBottomInset: false,
            body: StreamBuilder(
                stream: tourController.singleTourSnapshot(tourId: id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                        child: ErrorEmptyWidget(
                      title: 'Error: ${snapshot.error}',
                    ));
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Center(
                        child: ErrorEmptyWidget(
                      title: 'Tour not available',
                    ));
                  }

                  final tourData = snapshot.data!.data()!;
                  final tourModel = TourModel.fromMap(tourData);

                  return Column(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Stack(
                          children: [
                            ImageSliderWidget(imageList: tourModel.imageList!),
                            _buildUpperButton(),
                            ChangeNotifierProvider.value(
                              value: tourModel,
                              child: TourDetailsWidget(
                                  tabController: tabController),
                            ),
                            Positioned(
                              top: 0.23.sh,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: AppColors.red,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  IconlyBold.bookmark,
                                  color: AppColors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ChangeNotifierProvider.value(
                          value: tourModel,
                          child: const BookNowWidget(),
                        ),
                      )
                    ],
                  );
                })));
  }

  Positioned _buildUpperButton() {
    return Positioned(
        top: 20.h,
        left: 20.w,
        right: 20.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClickIconWidget(
              icon: Icons.arrow_back_ios_outlined,
              function: () {
                Get.back();
              },
            ),
            ClickIconWidget(
                function: () {
                  Get.back();
                },
                icon: Icons.share),
          ],
        ));
  }
}

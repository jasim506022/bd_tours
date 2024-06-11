import 'package:bd_tour_firebase/const/gobalcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRoundButtonWidget extends StatelessWidget {
  const CustomRoundButtonWidget(
      {super.key,
      required this.title,
      required this.onPress,
      this.buttonColors,
      this.width = 60,
      this.height = 50,
      });


  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color? buttonColors;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: height,
          width: width,
          margin: EdgeInsets.symmetric(horizontal: Get.width * .2),
          decoration: BoxDecoration(
              color: buttonColors ?? AppColors.greenColor,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}

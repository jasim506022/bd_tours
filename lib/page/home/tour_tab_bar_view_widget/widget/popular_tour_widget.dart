import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../const/gobalcolor.dart';
import '../../../../model/tourmodel.dart';

class PopularTourWidget extends StatelessWidget {
  const PopularTourWidget({
    super.key,
    required this.tourModel,
  });

  final TourModel tourModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => DetailsTourPage(tourModel: tourModel),
        //     ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          height: 140,
          width: 190,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.network(
                      tourModel.image!,
                      height: 120,
                      width: 260,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(
                        IconlyLight.heart,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: Text(
                            tourModel.name!,
                            style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontWeight: FontWeight.w800,
                                fontSize: 13),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(tourModel.ratting.toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12)),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

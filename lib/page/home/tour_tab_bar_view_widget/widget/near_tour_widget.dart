import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../const/gobalcolor.dart';
import '../../../../model/tourmodel.dart';


class NearTourWidget extends StatelessWidget {
  const NearTourWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tourModel = Provider.of<TourModel>(context, listen: false);
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
          height: 210,
          width: 260,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.network(
                      tourModel.image!,
                      height: 145,
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
                        Text(
                          tourModel.name!,
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(tourModel.ratting!.toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15)),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${tourModel.guidelist!.length} Guides 60 Available",
                          style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: double.infinity,
                        child: Row(
                          children: [
                            if (tourModel.guidelist!.length > 5)
                              for (int i = 0; i < 5; i++)
                                Align(
                                  widthFactor: .7,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundImage: NetworkImage(
                                        tourModel.guidelist![i].image!),
                                  ),
                                )
                            else
                              for (int i = 0;
                                  i < tourModel.guidelist!.length;
                                  i++)
                                Align(
                                  widthFactor: .7,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundImage: NetworkImage(
                                        tourModel.guidelist![i].image!),
                                  ),
                                ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${tourModel.guidelist!.length} like this",
                              style: GoogleFonts.poppins(
                                  letterSpacing: 1,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            )
                          ],
                        ))
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

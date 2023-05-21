import 'package:flutter/material.dart';
import 'package:movie/utils/colors.dart';
import 'package:movie/utils/ext_date.dart';
import 'package:movie/utils/ext_text.dart';
import 'package:movie/widget/custom_image.dart';
import 'package:provider/provider.dart';

import '../../providers/tv_on_air_provider.dart';
import '../../widget/widget_route.dart';

class ChannelOnAir extends StatelessWidget {
  const ChannelOnAir({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          // backgroundColor:OPrimaryBlack,
          color: OPrimaryBlack,
          child: Consumer<TvOnAirProvider>(builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.tvChannel.length,
                  addRepaintBoundaries: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(createChannelRoute(value.tvChannel[index].id.toString()));
                      },
                      child: Row(
                        children: [
                          Stack(children: [
                            CustomImage(
                              roundedCorner: 0,
                              containerColor: OPrimaryBlack,
                              heigt: 250,
                              iconSize: 50,
                              imageUrl: "https://image.tmdb.org/t/p/w500/${value.tvChannel[index].posterPath}",
                              textSize: 30,
                              width: size.width,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0.7),
                                      Colors.black.withOpacity(0.9),
                                      Colors.black,
                                      Colors.black,
                                      Colors.black,
                                      Colors.black,
                                    ],
                                  )),
                              height: 250,
                              width: size.width,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(value.tvChannel[index].name).white().p20m(),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 15,
                                              decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(3)), color: OPrimaryColor),
                                              child: Center(child: Text(value.tvChannel[index].voteAverage.toString()).p10b()),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(value.tvChannel[index].firstAirDate.toYear()).p10r().clamGrey(),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(value.tvChannel[index].originCountry[0]).p10r().clamGrey(),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("${value.tvChannel[index].voteCount} Vote").p10r().clamGrey(),
                                            // Icon(
                                            //   Icons.thumb_up,
                                            //   color: OCalmGrey,
                                            //   size: 8,
                                            // )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    );
                  });
            }
          }),
        ),
      ],
    );
  }
}

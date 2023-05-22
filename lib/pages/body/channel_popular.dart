import 'package:flutter/material.dart';
import 'package:movie/utils/colors.dart';
import 'package:movie/utils/ext_text.dart';
import 'package:provider/provider.dart';

import '../../providers/tv_popular_provider.dart';
import '../../widget/custom_image.dart';
import '../../widget/widget_route.dart';

class PopularChannel extends StatelessWidget {
  const PopularChannel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: OPrimaryBlack,
      padding: const EdgeInsets.only(left: 16),
      height: 150.0,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Popular Channel").white().p15b(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("See More").white().p10r(),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 10,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 140.0,
            child: Consumer<TvPopularProvider>(builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.tvChannel.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(createChannelRoute(value.tvChannel[index].id.toString()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Stack(children: [
                                CustomImage(
                                  roundedCorner: 10,
                                  containerColor: OPrimaryBlack,
                                  heigt: 80,
                                  iconSize: 50,
                                  imageUrl: "https://image.tmdb.org/t/p/w500/${value.tvChannel[index].posterPath}",
                                  textSize: 30,
                                  width: 140,
                                ),
                              ]),
                              const SizedBox(
                                width: 13,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 150.0,
                            child: Text(
                              value.tvChannel[index].name,
                              maxLines: 1,
                            ).p11r().calmWhite(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                  value.tvChannel[index].overview,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ).p10r().grey(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}

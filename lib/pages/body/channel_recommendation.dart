import 'package:flutter/material.dart';
import 'package:movie/utils/ext_text.dart';
import 'package:provider/provider.dart';

import '../../providers/tv_recommendation_provider.dart';
import '../../utils/colors.dart';
import '../../widget/custom_image.dart';
import '../../widget/widget_route.dart';

class RecommendationChannel extends StatelessWidget {
  const RecommendationChannel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
            height: 170.0,
            child: Consumer<TvRecommendationProvider>(builder: (context, value, child) {
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
                                  roundedCorner: 5,
                                  containerColor: OPrimaryBlack,
                                  heigt: 120,
                                  iconSize: 50,
                                  imageUrl: "https://image.tmdb.org/t/p/w500/${value.tvChannel[index].backdropPath}",
                                  textSize: 30,
                                  width: 200,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.2),
                                  width: 200.0,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    child: SizedBox(
                                      width: 200,
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.play_circle_fill_outlined,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          Text(
                                            value.tvChannel[index].name,
                                            textAlign: TextAlign.center,
                                          ).white().p12r(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                width: 13,
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            })),
      ),
    );
  }
}

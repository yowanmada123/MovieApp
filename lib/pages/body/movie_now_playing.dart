import 'package:flutter/material.dart';
import 'package:movie/utils/colors.dart';
import 'package:movie/utils/ext_date.dart';
import 'package:movie/utils/ext_text.dart';
import 'package:provider/provider.dart';

import '../../providers/movies_now_playing_provider.dart';
import '../../widget/custom_image.dart';
import '../../widget/widget_route.dart';

class MovieNowPlaying extends StatelessWidget {
  const MovieNowPlaying({
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
          child: Consumer<MoviesNowPlayingProvider>(builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.nowPlayingMovies.length,
                    addRepaintBoundaries: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(createRoute(value.nowPlayingMovies[index].id.toString()));
                        },
                        child: Row(
                          children: [
                            Stack(children: [
                              CustomImage(
                                roundedCorner: 10,
                                containerColor: OPrimaryBlack,
                                heigt: 230,
                                iconSize: 50,
                                imageUrl: "https://image.tmdb.org/t/p/w500/${value.nowPlayingMovies[index].backdropPath}",
                                textSize: 30,
                                width: size.width - 36,
                              ),
                              Container(
                                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
                                height: 230,
                                width: size.width - 36,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.play_circle_fill_outlined,
                                      color: Colors.white,
                                      size: 80,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(value.nowPlayingMovies[index].title).white().p20m(),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 33,
                                          height: 15,
                                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(3)), color: OPrimaryColor),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 10,
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(value.nowPlayingMovies[index].voteAverage.toString()).p10b(),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(DateTime.parse(value.nowPlayingMovies[index].releaseDate).toYear()).p10r().clamGrey(),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        value.nowPlayingMovies[index].adult ? const Text("18+").p10r().clamGrey() : const Text("A7+").p10r().clamGrey(),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text("${value.nowPlayingMovies[index].voteCount.toString()} Votes").p10r().clamGrey(),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ]),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      );
                    }),
              );
            }
          }),
          // Text("data")
        ),
      ],
    );
  }
}

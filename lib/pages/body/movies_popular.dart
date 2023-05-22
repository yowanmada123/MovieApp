import 'package:flutter/material.dart';
import 'package:movie/utils/colors.dart';
import 'package:movie/utils/ext_text.dart';
import 'package:provider/provider.dart';

import '../../providers/movies_popular_provider.dart';
import '../../widget/custom_image.dart';
import '../../widget/widget_route.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Container(
        color: OPrimaryBlack,
        padding: const EdgeInsets.only(left: 16),
        height: 260.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Popular Movies").white().p15b(),
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
              height: 10,
            ),
            SizedBox(
              height: 223.0,
              child: Consumer<MoviesPopularProvider>(builder: (context, value, child) {
                if (value.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.popularMovies.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(createRoute(value.popularMovies[index].id.toString()));
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
                                    heigt: 160,
                                    iconSize: 50,
                                    imageUrl: "https://image.tmdb.org/t/p/w500/${value.popularMovies[index].posterPath}",
                                    textSize: 30,
                                    width: 150,
                                  ),
                                  index.isEven
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.only(top: 10.0, left: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: 30,
                                                height: 15,
                                                decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(3)), color: OPrimaryColor),
                                                child: Center(child: const Text("HD").p10b()),
                                              ),
                                            ],
                                          ),
                                        )
                                ]),
                                const SizedBox(
                                  width: 13,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 150.0,
                              child: Text(
                                value.popularMovies[index].title,
                                // "Greta - Gerwig's Little Woman",
                                maxLines: 1,
                              ).p12r().calmWhite(),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 140.0,
                                  child: Text(
                                    value.popularMovies[index].overview,
                                    // "a hit man wanting to hit the fuck a man, i don't want to be toxic",
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
              }
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

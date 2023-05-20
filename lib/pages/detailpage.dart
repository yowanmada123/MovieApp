import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/colors.dart';
import 'package:movie/utils/ext_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomHour = random.nextInt(3) + 1;
    int randomMinute = random.nextInt(59) + 1;

    return Scaffold(
      body: Stack(children: [
        ClipRRect(
            child: Image.network(
          width: double.infinity,
          height: 550,
          'https://upload.wikimedia.org/wikipedia/en/3/37/Captain_America_The_First_Avenger_poster.jpg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Column(
              children: [
                Container(
                  height: 400,
                  color: OPrimaryBlack,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.warning_rounded,
                        color: Colors.red,
                        size: 50,
                      ),
                      Text(
                        'No Available Image',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        )),
        CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Text("Captain America"),
              centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, //New
                      blurRadius: 1.0,
                      offset: Offset(0, -1))
                ], color: OPrimaryBlack, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 2, color: Colors.white))),
                      )
                      // Icon(Icons.stripe)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text("Captain America").white().p20m(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 30,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            addRepaintBoundaries: true,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8), decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)), child: Text("Comedy").black().p10r()),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.date_range,
                                color: Colors.white,
                                size: 15,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("2019").clamGrey().p12r(),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 5,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.timelapse_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("${randomHour} h ${randomMinute} min").clamGrey().p12r(),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 5,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("557 Review").clamGrey().p12r(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(width: 65, height: 28, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: OPrimaryColor), child: Center(child: Text("IMDB 4.8").black().p10m())),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Tagline").clamGrey().p15b(),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("# Close your eyes. Open your heart.").clamGrey().p12r(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Plot Summary").clamGrey().p15b(),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "A man entranced by his dreams and imagination is lovestruck with a French woman and feels he can show her his world.",
                        textAlign: TextAlign.justify,
                      ).clamGrey().p12r(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Production Company").clamGrey().p15b(),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 90,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            addRepaintBoundaries: true,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Column(
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(1000.0),
                                          child: Image.network(
                                            width: 50,
                                            height: 50,
                                            'https://upload.wikimedia.org/wikipedia/en/3/37/Captain_America_The_First_Avenger_poster.jpg',
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Column(
                                                children: [
                                                  Container(
                                                    height: 400,
                                                    color: OPrimaryBlack,
                                                    alignment: Alignment.center,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: const [
                                                        Icon(
                                                          Icons.warning_rounded,
                                                          color: Colors.red,
                                                          size: 50,
                                                        ),
                                                        Text(
                                                          'No Available Image',
                                                          style: TextStyle(fontSize: 30, color: Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text("Gaumont").clamGrey().p10r(),
                                      Text("FR").grey().p9r(),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  )
                                ],
                              );
                            }),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ]),
                  )
                ]),
              ),
            ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate((_, __) {
            //     return Container(
            //       decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
            //       child: Column(
            //         children: List.generate(80, (index) => Container(child: ListTile(title: Text("$index nothing")))),
            //       ),
            //     );
            //   }, childCount: 1),
            // )
          ],
        ),
      ]),
    );
  }
}

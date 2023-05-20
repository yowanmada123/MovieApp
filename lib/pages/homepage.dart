import 'package:flutter/material.dart';
// import 'package:movie/pages/detailpages.dart';
import 'package:movie/pages/detailpage.dart';
import 'package:movie/utils/colors.dart';
import 'package:movie/utils/ext_text.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBarExample();
  }
}

class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({super.key});

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = const [
    Tab(
      text: "Movie",
    ),
    Tab(
      text: "Television",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: OPrimaryBlack,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: OPrimaryBlack,
                pinned: false,
                expandedHeight: 20.0,
                primary: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Container(
                    color: OPrimaryBlack,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).push(Material)
                                },
                                child: Image.asset(
                                  "assets/logo.png",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Movie",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 16.0, left: 8),
                            child: Icon(Icons.bookmark_border, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                centerTitle: false,
                titleSpacing: 5,
                // actions: const [],
              ),
              SliverAppBar(
                backgroundColor: OPrimaryBlack,
                pinned: true,
                // snap: _snap,
                // floating: _floating,
                expandedHeight: 10.0,
                title: Align(
                  alignment: AlignmentDirectional.center,
                  child: TabBar(
                      // controller: _controller,
                      onTap: (index) {
                        _controller.index = index;
                        print(index);
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            _selectedIndex = _controller.index;

                            // _selectedTabbar = index;
                            print("$index");
                          });
                        });
                        // setState(() {});
                      },
                      isScrollable: false,
                      labelColor: Colors.white,
                      unselectedLabelColor: OGrey,
                      // indicator: BoxDecoration(color: OPrimaryColor, borderRadius: BorderRadius.circular(5)),
                      indicatorWeight: 2.0,
                      indicatorColor: OPrimaryColor,
                      indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
                      //indicator: ShapeDecoration(shape: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0, style: BorderStyle.solid)), gradient: LinearGradient(colors: [Color(0xff0081ff), Color(0xff01ff80)])),
                      tabs: list),
                ),
                centerTitle: false,
                titleSpacing: 5,
                // actions: const [],
              ),
              // SliverToBoxAdapter(
              //   child: Container(
              //     height: 50,
              //     child: TabBarView(
              //       controller: _controller,
              //       children: [
              //         Center(
              //             child: Text(
              //           _selectedIndex.toString(),
              //           style: TextStyle(fontSize: 40),
              //         ).white()),
              //         Center(
              //             child: Text(
              //           _selectedIndex.toString(),
              //           style: TextStyle(fontSize: 40),
              //         ).white()),
              //       ],
              //     ),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 250,
                  child: TabBarView(children: [
                    Column(
                      children: [
                        Container(
                          height: 250,
                          // backgroundColor:OPrimaryBlack,
                          color: OPrimaryBlack,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                addRepaintBoundaries: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Navigator.pushNamed(context, '/detail');
                                      Navigator.of(context).push(_createRoute());
                                    },
                                    child: Row(
                                      children: [
                                        Stack(children: [
                                          SizedBox(
                                            width: size.width - 36,
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              child: SizedBox(
                                                width: size.width - 36,
                                                height: 230,
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Image.asset("assets/captain.jpeg"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Container(color: OPrimaryBlack, height: 230, width: size.width, child: FittedBox(fit: BoxFit.fitWidth, child: Image.asset("assets/captain.jpeg"))),
                                          Container(
                                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.8), borderRadius: BorderRadius.circular(10)),
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
                                                const Text("Captain America").white().p20m(),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 30,
                                                      height: 15,
                                                      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(3)), color: OPrimaryColor),
                                                      child: Center(child: const Text("7.9").p10b()),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    const Text("2015").p10r().clamGrey(),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    const Text("7+").p10r().clamGrey(),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    const Text("3379 Likes").p10r().clamGrey(),
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
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 250,
                          // backgroundColor:OPrimaryBlack,
                          color: OPrimaryBlack,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              addRepaintBoundaries: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Stack(children: [
                                      Container(color: OPrimaryBlack, height: 230, width: size.width, child: FittedBox(fit: BoxFit.fitWidth, child: Image.asset("assets/captain.jpeg"))),
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
                                        height: 235,
                                        width: size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text("Captain America").white().p20m(),
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
                                                        child: Center(child: const Text("7.9").p10b()),
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      const Text("2015").p10r().clamGrey(),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      const Text("7+").p10r().clamGrey(),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      const Text("3379 Likes").p10r().clamGrey(),
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
                                );
                              }),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: _selectedIndex == 1 ? 210 : 280,
                  child: TabBarView(physics: const NeverScrollableScrollPhysics(), children: [
                    Container(
                      height: 280,
                      child: Container(
                        color: OPrimaryBlack,
                        padding: const EdgeInsets.only(left: 16),
                        height: 280.0,
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
                              height: 240.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Stack(children: [
                                            SizedBox(
                                              width: 140.0,
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                child: SizedBox(
                                                  width: 150,
                                                  height: 160,
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child: Image.asset("assets/captain.jpeg"),
                                                  ),
                                                ),
                                              ),
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
                                        child: const Text(
                                          "Greta - Gerwig's Little Woman",
                                          maxLines: 2,
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
                                            child: const Text(
                                              "a hit man wanting to hit the fuck a man, i don't want to be toxic",
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                            ).p10r().grey(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 140,
                      child: Container(
                        color: OPrimaryBlack,
                        padding: const EdgeInsets.only(left: 16),
                        height: 140.0,
                        child: Column(
                          children: [
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
                              height: 10,
                            ),
                            SizedBox(
                              height: 170.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Stack(children: [
                                            SizedBox(
                                              width: 140.0,
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                child: SizedBox(
                                                  width: 150,
                                                  height: 90,
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child: Image.asset("assets/captain.jpeg"),
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
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width: 150.0,
                                        child: const Text(
                                          "Greta - Gerwig's Little Woman",
                                          maxLines: 2,
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
                                            child: const Text(
                                              "a hit man wanting to hit the fuck a man, i don't want to be toxic",
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                            ).p10r().grey(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: OPrimaryBlack,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 40.0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _selectedIndex == 1 ? const Text("TV Show").white().p15b() : const Text("Recommendation").white().p15b(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              _selectedIndex == 0
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Stack(children: [
                                      SizedBox(
                                        width: 150.0,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          child: SizedBox(
                                            width: 150,
                                            height: 90,
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset("assets/captain.jpeg"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      index.isEven
                                          ? Container()
                                          : Padding(
                                              padding: const EdgeInsets.only(left: 8.0, top: 5),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // width: 150.0,
                                            child: const Text(
                                              "Greta - Gerwig's Little Woman",
                                              maxLines: 1,
                                            ).p12r().white(),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Container(
                                            // width: 150.0,
                                            child: const Text(
                                              "2019",
                                              style: TextStyle(color: Colors.grey),
                                              maxLines: 2,
                                            ).p11m(),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: const Text(
                                                  "a hit man wanting to hit the fuck a man, i don't want to be toxic",
                                                  maxLines: 2,
                                                  textAlign: TextAlign.start,
                                                ).p10r().grey(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              )
                            ],
                          );
                        },
                        childCount: 20,
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SizedBox(
                          height: 170.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Stack(children: [
                                        SizedBox(
                                          width: 200.0,
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                                            child: SizedBox(
                                              width: 200,
                                              height: 120,
                                              child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: Image.asset("assets/captain.jpeg"),
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
                              );
                            },
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DetailPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

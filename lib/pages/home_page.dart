import 'package:flutter/material.dart';
import 'package:movie/pages/search_page.dart';
import 'package:movie/utils/colors.dart';
import 'package:movie/utils/ext_date.dart';
import 'package:movie/utils/ext_text.dart';
import 'package:provider/provider.dart';
import '../providers/movies_recommendation_provider.dart';
import '../widget/custom_image.dart';
import '../widget/widget_route.dart';
import 'body/channel_on_air.dart';
import 'body/channel_popular.dart';
import 'body/channel_recommendation.dart';
import 'body/movie_now_playing.dart';
import 'body/movies_popular.dart';

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
                  title: HomePageAppBar(),
                ),
                centerTitle: false,
                titleSpacing: 5,
              ),
              SliverAppBar(
                backgroundColor: OPrimaryBlack,
                pinned: true,
                expandedHeight: 10.0,
                title: Align(
                  alignment: AlignmentDirectional.center,
                  child: TabBar(
                      onTap: (index) {
                        _controller.index = index;
                        print(index);
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            _selectedIndex = _controller.index;
                            print("$index");
                          });
                        });
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
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 250,
                  child: TabBarView(children: [
                    MovieNowPlaying(size: size),
                    ChannelOnAir(size: size),
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: _selectedIndex == 0 ? 260 : 210,
                  child: const TabBarView(physics: NeverScrollableScrollPhysics(), children: [PopularMovies(), PopularChannel()]),
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
              _selectedIndex == 0 ? RecommendationMovies() : const RecommendationChannel(),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget HomePageAppBar() {
    return Row(
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
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              },
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16.0, left: 8),
              child: Icon(Icons.bookmark_border, color: Colors.white),
            )
          ],
        )
      ],
    );
  }

  Widget RecommendationMovies() {
    return SliverToBoxAdapter(child: Consumer<MoviesRecommendationProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.recomendationMovies.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(createRoute(value.recomendationMovies[index].id.toString()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Stack(children: [
                                    CustomImage(
                                      roundedCorner: 10,
                                      containerColor: OPrimaryBlack,
                                      heigt: 90,
                                      iconSize: 50,
                                      imageUrl: "https://image.tmdb.org/t/p/w500/${value.recomendationMovies[index].backdropPath}",
                                      textSize: 30,
                                      width: 150,
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
                                          child: Text(
                                            value.recomendationMovies[index].title,
                                            // "Greta - Gerwig's Little Woman",
                                            maxLines: 1,
                                          ).p12r().white(),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Container(
                                          // width: 150.0,
                                          child: Text(
                                            value.recomendationMovies[index].releaseDate.toYear().toString(),
                                            // "2019",
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
                                              child: Text(
                                                value.recomendationMovies[index].overview,
                                                // "a hit man wanting to hit the fuck a man, i don't want to be toxic",
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
                          ),
                          const SizedBox(
                            height: 12,
                          )
                        ],
                      )),
            ],
          ),
        );
      }
    }));
  }
}

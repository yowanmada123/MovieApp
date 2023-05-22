import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/utils/colors.dart';
import 'package:movie/utils/ext_text.dart';
import 'package:movie/widget/custom_image.dart';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';
import '../models/tv_model.dart';
import '../utils/const.dart';
import '../widget/widget_route.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> with SingleTickerProviderStateMixin {
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
      // print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: DefaultTabController(
                length: 2,
                child: CustomScrollView(slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: OPrimaryBlack,
                    pinned: true,
                    expandedHeight: 10.0,
                    title: Align(
                      alignment: AlignmentDirectional.center,
                      child: TabBar(
                          onTap: (index) {
                            _controller.index = index;
                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() {
                                _selectedIndex = _controller.index;
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
                      height: 60,
                      child: TabBarView(children: [
                        MySearch(text: "Cari film yang kamu mau", isMovieSearch: true),
                        MySearch(text: "Cari channel TV yang kamu mau", isMovieSearch: false),
                      ]),
                    ),
                  ),
                ]))));
  }
}

class MySearch extends StatelessWidget {
  MySearch({super.key, required this.text, required this.isMovieSearch});
  var searchController = TextEditingController();
  final String text;
  final bool isMovieSearch;
  @override
  Widget build(BuildContext context) {
    Future<void> search() async {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ListBySearchPage(
                  id: searchController.text,
                  isMovieSearch: isMovieSearch,
                )),
      );
    }

    return Container(
      color: OPrimaryBlack,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: text,
                hintStyle: const TextStyle(fontSize: 14),
                border: InputBorder.none,
                suffixIcon: InkWell(
                  onTap: () {
                    search();
                  },
                  child: const Icon(
                    Icons.search,
                    color: Color(0xffA9A9A9),
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}

class ListBySearchPage extends StatefulWidget {
  const ListBySearchPage({Key? key, required this.id, required this.isMovieSearch}) : super(key: key);
  final String id;
  final bool isMovieSearch;

  @override
  _ListBySearchPageState createState() => _ListBySearchPageState();
}

class _ListBySearchPageState extends State<ListBySearchPage> {
  List<Movie> _listMovieBySearch = [];
  List<Tv> _listChannelBySearch = [];

  Future<void> getMyMovie() async {
    try {
      final response = await http.get(Uri.parse('$BASEURL/search/movie?query=${widget.id}&api_key=$APIKEY'));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var jsonObject = json.decode(response.body);
        var respon = json.encode(jsonObject['results']);
        _listMovieBySearch = movieFromJson(respon);
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Cek Koneksi Jaringan Anda"),
      ));
    }
  }

  Future<void> getMyChannel() async {
    try {
      final response = await http.get(Uri.parse('$BASEURL/search/tv?query=${widget.id}&api_key=$APIKEY'));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var jsonObject = json.decode(response.body);
        var respon = json.encode(jsonObject['results']);
        _listChannelBySearch = tvFromJson(respon);
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Cek Koneksi Jaringan Anda"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: OPrimaryBlack,
        title: widget.isMovieSearch ? Text("List Movie") : Text("List Channel"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(height: 20),
            FutureBuilder<void>(
              future: widget.isMovieSearch ? getMyMovie() : getMyChannel(),
              builder: (BuildContext context, AsyncSnapshot<void> data) {
                Widget children;
                if (data.connectionState == ConnectionState.done) {
                  children = ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.isMovieSearch ? _listMovieBySearch.length : _listChannelBySearch.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (widget.isMovieSearch) {
                              Navigator.of(context).push(createRoute(_listMovieBySearch[index].id.toString()));
                            } else {
                              Navigator.of(context).push(createChannelRoute(_listChannelBySearch[index].id.toString()));
                            }
                          },
                          child: Column(
                            children: [
                              ListTile(
                                leading: CustomImage(
                                  roundedCorner: 10,
                                  containerColor: OPrimaryBlack,
                                  heigt: 60,
                                  iconSize: 10,
                                  imageUrl: widget.isMovieSearch ? "$BASEIMAGE${_listMovieBySearch[index].posterPath}" : "$BASEIMAGE${_listChannelBySearch[index].posterPath}",
                                  textSize: 2,
                                  width: 80,
                                ),
                                title: Text(
                                  widget.isMovieSearch ? _listMovieBySearch[index].title : _listChannelBySearch[index].name,
                                  maxLines: 1,
                                ).p15m(),
                                subtitle: Text(
                                  widget.isMovieSearch ? _listMovieBySearch[index].overview : _listChannelBySearch[index].overview,
                                  maxLines: 1,
                                ).p12m(),
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              // const SizedBox(height: 5),
                            ],
                          ),
                        );
                      });
                } else if (data.connectionState == ConnectionState.waiting) {
                  children = const SafeArea(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  children = const Center(
                    child: Text("Coba Jek Konek Jaringan Anda"),
                  );
                }
                return Center(
                  child: children,
                );
              },
            ),
          ],
        )),
      ),
    );
  }
}

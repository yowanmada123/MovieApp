import 'package:flutter/material.dart';
import 'package:movie/utils/colors.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OPrimaryBlack,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: OPrimaryBlack,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
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
                                hintText: "Cari film yang kamu mau",
                                hintStyle: TextStyle(fontSize: 14),
                                border: InputBorder.none,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    // search();
                                    //  Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => ListInternbySearchScreen()),
                                    //   );
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
                      )
                    ],
                  ),
                ),
              ),
              //   height: 300,
              //   child: Consumer<TagProvider>(
              //     builder: (context, provider, _) => FutureBuilder(
              //      future: provider.getListTag(),
              //       builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //       List<ListTag>? data = snapshot.data as List<ListTag>?;
              //       return Column(
              //          children: data!
              //             .map((item) => SordByTag(item))
              //             .toList(),
              //       );
              //       }
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // find() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var login = prefs.containsKey('login');
  //   var isPaid = prefs.containsKey('isPaid');
  //   var isWfh = prefs.containsKey('isWfh');
  //   var TagId = prefs.containsKey('TagId');

  //   if(prefs.containsKey('isPaid')){
  //     if(prefs.containsKey('isWfh')){
  //       if(prefs.containsKey('TagId')){
  //           // tag wfh ispaid
  //       }

  //     }else if(prefs.containsKey('TagId')){
  //       if(prefs.containsKey('isWfh')){
  //           // tag wfh ispaid
  //       }else{

  //       }
  //     }
  //     else{

  //     }

  //   }else if(prefs.containsKey('isWfh')){

  //   }else if (prefs.containsKey('isPaid')){

  //   }
  // }

  horizontalDivider() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 0,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Color(0xFFE5DCDC)),
        ),
      ),
    );
  }

  vertikalDivider() {
    return Container(
      width: 0,
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 1.0, color: Color(0xFFE4E4E4)),
        ),
      ),
    );
  }

  // Future<void> search() async {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('search', searchController.text);
  //     Navigator.push(
  //      context,
  //      MaterialPageRoute(
  //      builder: (context) => ListInternbySearchScreen()),
  //      );
  // }
}

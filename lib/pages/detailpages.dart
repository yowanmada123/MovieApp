// import 'package:flutter/material.dart';
// import 'package:movie/utils/colors.dart';

// class DetailPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: OPrimaryBlack,
//       body: SafeArea(
//         child: Stack(children: [
//           Container(
//             height: 550,
//             width: double.infinity,
//             decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/3/37/Captain_America_The_First_Avenger_poster.jpg'))),
//           ),
//           CustomScrollView(
//             anchor: 0.4,
//             slivers: <Widget>[
//               // SliverWidget(
//               //   child: Container(
//               //     width: double.infinity,
//               //     height: 100,
//               //     decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
//               //     child: TabBar(
//               //       tabs: [FlutterLogo(), FlutterLogo()],
//               //     ),
//               //   ),
//               // ),
//               // SliverAppBar(
//               //     //pinned: true,
//               //     backgroundColor: OPrimaryBlack,
//               //     pinned: false,
//               //     expandedHeight: 150,
//               //     primary: false,
//               //     flexibleSpace: FlexibleSpaceBar(
//               //       background: GestureDetector(
//               //         child: Hero(
//               //           tag: "tag",
//               //           child: Image.network(
//               //             'https://upload.wikimedia.org/wikipedia/en/3/37/Captain_America_The_First_Avenger_poster.jpg',
//               //             fit: BoxFit.cover,
//               //           ),
//               //         ),
//               //         onTap: () {
//               //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => HeroImage()));
//               //         },
//               //       ),
//               //     )),
//               // SliverToBoxAdapter(
//               //   child: Container(
//               //     color: Colors.transparent,
//               //     height: 20,
//               //     child: Column(
//               //       mainAxisAlignment: MainAxisAlignment.end,
//               //       children: <Widget>[
//               //         Container(
//               //           height: 20,
//               //           decoration: BoxDecoration(
//               //             color: Colors.white,
//               //             borderRadius: BorderRadius.only(
//               //               topLeft: const Radius.circular(20.0),
//               //               topRight: const Radius.circular(20.0),
//               //             ),
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               // SliverList(),
//               SliverToBoxAdapter(
//                 child: SizedBox(
//                   height: 200,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Row(
//                       children: [
//                         Column(
//                           children: [
//                             SizedBox(
//                               height: 20,
//                             ),
//                             SizedBox(
//                               width: 100,
//                               height: 150,
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                 child: SizedBox(
//                                   width: 100,
//                                   height: 300,
//                                   child: FittedBox(
//                                     fit: BoxFit.cover,
//                                     child: Image.asset("assets/captain.jpeg"),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//               // SliverFixedExtentList(
//               //   itemExtent: 300,
//               //   delegate: SliverChildListDelegate([
//               //     Row(
//               //       children: [
//               //         SizedBox(
//               //           width: 100,
//               //           // height: 300,
//               //           child: ClipRRect(
//               //             borderRadius: const BorderRadius.all(Radius.circular(10)),
//               //             child: SizedBox(
//               //               width: 100,
//               //               height: 300,
//               //               child: FittedBox(
//               //                 fit: BoxFit.fitWidth,
//               //                 child: Image.asset("assets/captain.jpeg"),
//               //               ),
//               //             ),
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //     // Container(color: Colors.red),
//               //     // Container(color: Colors.green),
//               //     // Container(color: Colors.blue),
//               //   ]),
//               // ),
//               // SliverList(
//               //   delegate: SliverChildBuilderDelegate(
//               //     (context, index) {
//               //       return Container(
//               //         height: 50,
//               //         alignment: Alignment.center,
//               //         color: Colors.orange[100 * (index % 9)],
//               //         child: Text('orange $index'),
//               //       );
//               //     },
//               //     childCount: 9,
//               //   ),
//               // ),
//               // SliverGrid(
//               //   delegate: SliverChildBuilderDelegate(
//               //     (context, index) {
//               //       return Container(
//               //         alignment: Alignment.center,
//               //         color: Colors.teal[100 * (index % 9)],
//               //         child: Text('grid item $index'),
//               //       );
//               //     },
//               //     childCount: 30,
//               //   ),
//               //   // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//               //   //   maxCrossAxisExtent: 200.0,
//               //   //   mainAxisSpacing: 10.0,
//               //   //   crossAxisSpacing: 10.0,
//               //   //   childAspectRatio: 4.0,
//               //   // ),
//               //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               //     crossAxisCount: 3,
//               //     mainAxisSpacing: 15,
//               //     crossAxisSpacing: 15,
//               //     childAspectRatio: 2.0,
//               //   ),
//               // ),
//               // SliverToBoxAdapter(
//               //   child: Container(
//               //     color: Colors.yellow,
//               //     padding: const EdgeInsets.all(8.0),
//               //     child: Text('Grid Header', style: TextStyle(fontSize: 24)),
//               //   ),
//               // ),
//               // SliverGrid.count(
//               //   crossAxisCount: 3,
//               //   mainAxisSpacing: 10.0,
//               //   crossAxisSpacing: 10.0,
//               //   childAspectRatio: 4.0,
//               //   children: <Widget>[
//               //     Container(color: Colors.red),
//               //     Container(color: Colors.green),
//               //     Container(color: Colors.blue),
//               //     Container(color: Colors.red),
//               //     Container(color: Colors.green),
//               //     Container(color: Colors.blue),
//               //   ],
//               // ),
//               // SliverGrid.extent(
//               //   maxCrossAxisExtent: 200,
//               //   mainAxisSpacing: 10.0,
//               //   crossAxisSpacing: 10.0,
//               //   childAspectRatio: 4.0,
//               //   children: <Widget>[
//               //     Container(color: Colors.pink),
//               //     Container(color: Colors.indigo),
//               //     Container(color: Colors.orange),
//               //     Container(color: Colors.pink),
//               //     Container(color: Colors.indigo),
//               //     Container(color: Colors.orange),
//               //   ],
//               // ),
//             ],
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class HeroImage extends StatelessWidget {
//   const HeroImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Image Hero"),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 500,
//         child: Hero(
//           tag: "tag",
//           child: Image.network(
//             'https://upload.wikimedia.org/wikipedia/en/3/37/Captain_America_The_First_Avenger_poster.jpg',
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
//
// class LuShotRankingPage extends StatefulWidget {
//   const LuShotRankingPage({Key? key}) : super(key: key);
//
//   @override
//   State<LuShotRankingPage> createState() => _LuShotRankingPageState();
// }
//
// class _LuShotRankingPageState extends State<LuShotRankingPage> with TickerProviderStateMixin  {
//
//
//   late TabController type_tabController;
//   late TabController ranking_tabController;
//   late TabController day_tabController;
//
//   List tagsRankingList = ['影片榜','撸点榜'];
//   List tagsDay = ['日榜','周榜','月榜'];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     type_tabController = new TabController(length: tagsType.length, vsync: this,initialIndex: 0);
//     ranking_tabController = new TabController(length: tagsRankingList.length, vsync: this,initialIndex: 0);
//     day_tabController = new TabController(length: tagsDay.length, vsync: this,initialIndex: 0);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xffF0F0F0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             color: Colors.white,
//             height: 39,
//             width: screenWidth(),
//             child: initTypeList(),
//           ),
//           Container(
//             color: Colors.black,
//             height: 0.3,
//             width: screenWidth(),
//           ),
//           SizedBox(height: 16),
//           Center(
//             child:  Container(
//               child: initRankingList(),
//             ),
//           ),
//           SizedBox(height: 8),
//           Center(
//             child:  Container(
//               child: initDayList(),
//             ),
//           ),
//
//
//
//
//         ],
//       ),
//     );
//   }
//
//   initTypeList() {
//     return TabBar(indicator: TabIndicatorline(
//       borderSide: BorderSide(width: 3,color: Colors.red),
//       IndicatorWidth: 24,
//     ),
//       tabs: tagsType.map((e) => Text(e)).toList(),
//       isScrollable: true,
//       controller: type_tabController,
//       indicatorColor: Colors.red,
//       labelColor: Colors.black,
//       labelStyle: TextStyle(fontSize: 18,
//           fontWeight: FontWeight.bold),
//       unselectedLabelColor: Colors.grey,
//       unselectedLabelStyle: TextStyle(fontSize: 16,
//           fontWeight: FontWeight.normal),
//       indicatorSize: TabBarIndicatorSize.label,
//       onTap: (index) {
//         setState(() {
//
//         });
//       },
//     );
//   }
//
//   initRankingList() {
//     return TabBar(indicator: BoxDecoration(),
//       tabs: tagsRankingList.map((e) => Text(e)).toList(),
//       isScrollable: true,
//       controller: ranking_tabController,
//       indicatorColor: Colors.red,
//       labelColor: Colors.black,
//       labelStyle: TextStyle(fontSize: 16,
//           fontWeight: FontWeight.bold),
//       unselectedLabelColor: Colors.grey,
//       unselectedLabelStyle: TextStyle(fontSize: 14,
//           fontWeight: FontWeight.normal),
//       onTap: (index) {
//         setState(() {
//
//         });
//       },
//     );
//   }
//
//   initDayList() {
//     return TabBar(indicator: TabIndicatorline(
//       borderSide: BorderSide(width: 2,color: Colors.red),
//       IndicatorWidth: 16,
//     ),
//       tabs: tagsDay.map((e) => Text(e)).toList(),
//       isScrollable: true,
//       controller: day_tabController,
//       indicatorColor: Colors.red,
//       labelColor: Colors.black,
//       labelStyle: TextStyle(fontSize: 16,
//           fontWeight: FontWeight.bold),
//       unselectedLabelColor: Colors.grey,
//       unselectedLabelStyle: TextStyle(fontSize: 14,
//           fontWeight: FontWeight.normal),
//       indicatorSize: TabBarIndicatorSize.label,
//       onTap: (index) {
//         setState(() {
//
//         });
//       },
//     );
//   }
//
//
// }

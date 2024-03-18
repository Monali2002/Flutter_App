import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:star_astro_gpt/pages/others/custom_appBar.dart';
import 'package:star_astro_gpt/services/models/all_types_list.dart';
import 'package:star_astro_gpt/utilis/constants.dart';
import '../services/models/favourite_list.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<FavouriteListModel> favoriteList = [];
  List<AllTypesModel> alltypes = [];

  @override
  void inistate() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    favoriteList = FavouriteListModel.getFavouriteList();
    alltypes = AllTypesModel.getAllTypes();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: CustomAppBar(height: 60,),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          // hello text
          _helloText(),
          SizedBox(
            height: 15,
          ),
          // TabBar
          _tabBar(_tabController),
          SizedBox(
            height: 8,
          ),
          _allTypesList(),
          SizedBox(
            height: 20,
          ),
          _favourite(),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
              itemCount: favoriteList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 10, right: 10),
              itemBuilder: (context, index) {
                return Container(
                  height: 72,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        favoriteList[index].iconPath,
                        width: 50,
                        height: 50,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favoriteList[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(favoriteList[index].people),
                                maxRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 67,
                        height: 24,
                        child: Text(
                          ('1m ago'),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Sora',
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/slider.png'),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              radius: 23,
            ),
          ],
        ),
      ),
    );
  }

  Container _helloText() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: AppLargeText(text: "Hello \nDerek Doyle"),
    );
  }

  Container _allTypesList() {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      height: 250,
      width: double.maxFinite,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10, top: 10),
            width: 200,
            height: 0,
            decoration: BoxDecoration(
              color: Color(0xFFF3F5F6),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      image: DecorationImage(
                        image: AssetImage(alltypes[index].background),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(alltypes[index].iconPath),
                      ],
                    )),
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //     child: Image.asset(alltypes[index].iconPath),
                      // ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: Text(
                          alltypes[index].text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 15,
        ),
        itemCount: alltypes.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20, right: 20),
      ),
    );
  }

  Container _tabBar(TabController _tabController) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          labelPadding: const EdgeInsets.only(left: 10, right: 10),
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          // isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: CircleTabIndicator(color: Colors.black, radius: 4),
          tabs: [
            Tab(text: "All types"),
            Tab(text: "Images"),
            Tab(text: "Videos"),
            Tab(text: "Content"),
          ],
        ),
      ),
    );
  }

  Container _favourite() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppLargeText(
            text: "Favourites",
            size: 22,
          ),
          AppText(
            text: "See all",
            color: Colors.orangeAccent,
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

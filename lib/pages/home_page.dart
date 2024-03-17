import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // menu text
          Container(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/slider.png'),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                    maxRadius: 23,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          // hello text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Hello \nDerek Doyle"),
          ),
          SizedBox(
            height: 30,
          ),
          // TabBar
          Container(
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
          ),
          Container(
            padding: const EdgeInsets.only(left: 8),
            height: 250,
            width: double.maxFinite,
            child: ListView.separated(

                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.only(right: 10, top: 10),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F5F6),
                    ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                              height: 90,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image : AssetImage(alltypes[index].background),
                                  fit: BoxFit.fill,
                                ),
                              ),
                          ),

                          Container(
                            height: 150,
                            padding: const EdgeInsets.all(12),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Image.asset(alltypes[index].iconPath)
                                ),
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
                }, separatorBuilder:(context, index) => SizedBox(
              width: 15,
            ),
            itemCount: alltypes.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20,right: 20),),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Favorites",
                  size: 22,
                ),
                AppText(
                  text: "See all",
                  color: Colors.orangeAccent,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left:10),
            child: ListView.separated(
              itemCount: favoriteList.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              padding: const EdgeInsets.only(left: 10,right: 10),
              itemBuilder: (context,index){
                return Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(favoriteList[index].iconPath,
                      width: 50,
                      height: 50,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            backgroundImage: AssetImage(favoriteList[index].people),
                            maxRadius: 10,
                          ),
                        ],
                      ),

                      // SizedBox(width: 80,),
                      // Text("1m ago",
                      // style: TextStyle(
                      //   fontSize: 12,
                      //   color: Colors.grey,
                      //   fontWeight: FontWeight.w700,
                      // ),)
                    ],
                  ),

                );
            }
            ),
          )
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








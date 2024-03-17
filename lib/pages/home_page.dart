import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../services/models/favourite_list.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  List<FavouriteListModel> favoriteList =[];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  void _getFavouriteList() {
    widget.favoriteList = FavouriteListModel.getFavouriteList();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // menu text
          Container(
            padding: const EdgeInsets.only(top: 70,left: 20),
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
          SizedBox(height: 40,),
          // hello text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text:"Hello \nDerek Doyle"),
          ),
          SizedBox(height: 30,),
          // TabBar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 10,right: 10),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                // isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: Colors.black,radius: 4),
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
            padding:  const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(BuildContext context, int index){
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: DecorationImage(
                    image: AssetImage(
                    'assets/images/Rectangle 1.png'
                    ),
                    fit: BoxFit.cover
                    )
                    ),
                    );

                  },

                ),
                Text('Hello'),
                Text("There"),
                Text("Bye"),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            margin: const EdgeInsets.only(left:20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Favorites", size: 22,),

                AppText(text:"See all", color:Colors.orangeAccent,),
              ],
            ),
          ),
          SizedBox(height: 15,),
          ListView.builder(
            itemCount: widget.favoriteList.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context,int index){
              return Container(
                decoration: BoxDecoration(
                  color:Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 80.0,
              );
            },

          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({
   required this.color,
    required this.radius,
});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color,radius:radius);
  }
  
}

class _CirclePainter extends BoxPainter{
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
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height-radius);

    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}
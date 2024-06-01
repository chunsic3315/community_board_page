import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];
  late int _currentPageIndex;
  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
    datas= [
      {
        "title": "치킨 신드롬 추천 합니다.",
        "detail": "쏘핫 스페셜 맛있당",
        "category": "<정보>",
        "location": "개금 1동",
        "like" : "2",
        "image": "assets/images/ara-1.jpg",
      },
      {
        "title": "엽기 떡볶이 존맛",
        "detail": "매운데 스트레스 날아감",
        "category": "<정보>",
        "location": "개금 1동",
        "like" : "6",
        "image": "assets/images/ara-2.jpg"
      },
    ];
  }

  PreferredSizeWidget _appbarWidget(){
    return AppBar(
      title: GestureDetector(
        onTap: (){
          print("click");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("개금동"),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      elevation: 1,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: Row(
          mainAxisAlignment : MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "전체",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "인기글",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "정보",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "일상",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext _context, int index){
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(datas[index]["image"].toString(),
                  width: 100,
                  height: 100,
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        datas[index]["title"].toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize:15) ,),
                      SizedBox(height: 5),
                      Text(
                        datas[index]["detail"].toString(),
                        style: TextStyle(fontSize:12, color: Colors.black.withOpacity(0.3)),

                      ),
                      Text(datas[index]["category"].toString(),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/heart_off.svg",
                              width: 13,
                              height: 13,
                            ),
                            SizedBox(width: 5),
                            Text(datas[index]["like"].toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 2,
      separatorBuilder: (BuildContext _context, int index){
        return Container(height: 1,color: Colors.black.withOpacity(0.4));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}

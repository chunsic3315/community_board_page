import 'package:community_board_page/repository/contents_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Coummunity extends StatefulWidget {
  const Coummunity({Key? key}) : super(key: key);

  @override
  _CoummunityState createState() => _CoummunityState();
}

class _CoummunityState extends State<Coummunity> {
  List<Map<String, String>> datas = [];
  late int _currentPageIndex;
  String? currentLocation;
  final Map<String, String> locationTypeToString = {
    "Gaegeum": "개금동",
    "Gaya": "가야동",
    "Jurye": "주례동",
  };

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
    currentLocation = "Gaegeum";
    datas = [
      {
        "title": "치킨 신드롬 추천 합니다.",
        "detail": "쏘핫 스페셜 맛있당",
        "category": "#정보",
        "location": "개금 1동",
        "like": "2",
        "image": "assets/images/ara-1.jpg",
      },
      {
        "title": "엽기 떡볶이 존맛",
        "detail": "매운데 스트레스 날아감",
        "category": "#정보",
        "location": "개금 1동",
        "like": "6",
        "image": "assets/images/ara-2.jpg"
      },
    ];
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print("click");
        },
        child: PopupMenuButton<String>(
          offset: Offset(0, 30),
          shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              1),
          onSelected: (String where) {
            print(where);
            setState(() {
              currentLocation = where;
            });
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(value: "Gaegeum", child: Text("개금동")),
              PopupMenuItem(value: "Gaya", child: Text("가야동")),
              PopupMenuItem(value: "Jurye", child: Text("주례동")),
            ];
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(locationTypeToString[currentLocation] ?? ""),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
      elevation: 1,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
      ],
      bottom: TabBar(
        indicatorWeight: 5,
        tabs: [
          Tab(text: "전체"),
          Tab(text: "인기글"),
          Tab(text: "정보"),
          Tab(text: "일상"),
        ],
      ),
    );
  }

  _loadContents() {

  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext _context, int index) {
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
                        style: TextStyle(fontSize: 15),),
                      SizedBox(height: 5),
                      Text(
                        datas[index]["detail"].toString(),
                        style: TextStyle(fontSize: 12, color: Colors.black
                            .withOpacity(0.3)),

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
      separatorBuilder: (BuildContext _context, int index) {
        return Container(height: 1, color: Colors.black.withOpacity(0.4));
      },
    );
  }

  @override
  Widget build(BuildContext context) =>
      DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: _appbarWidget(),
            body: _bodyWidget()
        ),
      );
}

class ContentsRepository{ //서버로 부터 데이터를 받아오는 페이지 입니다.
  Map<String, dynamic> data= {
    "Gaegeum": [{
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
    ],
    "Gaya": [{
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
    ],
    "Jurye": [{
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
    ],
  };

  Future<dynamic> loadContentsFromLocation(String location)
  async{
    await Future.delayed(Duration(milliseconds: 1000));
    return data[location];
  }
}
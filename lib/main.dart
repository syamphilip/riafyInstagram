import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getApiData();
  }

  List apiData = [];

  void getApiData() async {
    var url = Uri.parse(
        "https://hiit.ria.rocks/videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas");
    var data = await http.get(url);
    var jsonResponse = convert.jsonDecode(data.body);
    setState(() {
      apiData = jsonResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: ListView.builder(
        itemCount: apiData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      apiData[index]["medium thumbnail"]),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            apiData[index]["channelname"],
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.more_vert,
                            color: Colors.black,
                            size: 20,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(apiData[index]["high thumbnail"]),
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.gratipay,
                                      size: 25,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.solidCommentDots,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.solidPaperPlane,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidBookmark,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(apiData[index]
                                                ["medium thumbnail"]),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      margin: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(apiData[index]
                                                ["medium thumbnail"]),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      margin: EdgeInsets.only(left: 20),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(apiData[index]
                                                ["medium thumbnail"]),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Liked by ",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    apiData[index]["channelname"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "and",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    "62,707 others",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, top: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiData[index]["channelname"],
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                    child: Text(
                                  apiData[index]["title"],
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "View all 931 comments",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

customAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Row(
      children: [
        Icon(
          Icons.camera_alt_outlined,
          color: Colors.black,
          size: 30.0,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Instagram",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 22),
        ),
      ],
    ),
    actions: [
      Container(
        margin: EdgeInsets.only(right: 15),
        child: Icon(
          Icons.message_outlined,
          color: Colors.black,
          size: 30.0,
        ),
      )
    ],
  );
}

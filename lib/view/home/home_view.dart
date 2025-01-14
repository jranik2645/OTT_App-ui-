import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ott_photo_play/view/home/movie_details.dart';
import 'package:ott_photo_play/view/home/tv_show_details_view.dart';

import '../../common/color_extension.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List watchArr = [
    "assets/img/mov_1.png",
    "assets/img/mov_2.png",
    "assets/img/mov_3.png",
    "assets/img/mov_4.png",
    "assets/img/mov_1.png",
    "assets/img/mov_2.png",
    "assets/img/mov_3.png",
    "assets/img/mov_4.png",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FBroadcast.instance().register("change_mode", (value, callback) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MovieDetailsView()));
              },
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: media.width,
                        height: media.width * 1.2,
                        child: ClipRect(
                          child: Image.asset(
                            TColor.tModeDark
                                ? "assets/img/home_image_dark.png"
                                : "assets/img/home_image_light.png",
                            width: media.width,
                            height: media.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "4.00",
                        style: TextStyle(
                          color: TColor.text,
                          fontSize: 35,
                        ),
                      ),
                      IgnorePointer(
                          ignoring: true,
                          child: RatingBar(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 18,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            ratingWidget: RatingWidget(
                              full: Image.asset('assets/img/star_fill.png'),
                              half: Image.asset('assets/img/star.png'),
                              empty: Image.asset('assets/img/star.png'),
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Movie",
                        style: TextStyle(
                          color: TColor.text,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        " | ",
                        style: TextStyle(
                          color: TColor.text,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Adventure",
                        style: TextStyle(
                          color: TColor.text,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        " | ",
                        style: TextStyle(
                          color: TColor.text,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Comedy",
                        style: TextStyle(
                          color: TColor.text,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        " | ",
                        style: TextStyle(
                          color: TColor.text,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Family",
                        style: TextStyle(
                          color: TColor.text,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Watching",
                    style: TextStyle(
                      color: TColor.text,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.46,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount: watchArr.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TvShowDetailsView() ));
                        },
                      child: Container(
                        color: TColor.card,
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: ClipRect(
                          child: Image.asset(
                            watchArr[index].toString(),
                            width: media.width * 0.33,
                            height: media.width * 0.5,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "New & Upcoming",
                    style: TextStyle(
                      color: TColor.text,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.46,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount: watchArr.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const TvShowDetailsView() ));
                       },
                      child: Container(
                        color: TColor.card,
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: ClipRect(
                          child: Image.asset(
                            watchArr[index].toString(),
                            width: media.width * 0.33,
                            height: media.width * 0.5,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Action",
                    style: TextStyle(
                      color: TColor.text,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.46,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount: watchArr.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TvShowDetailsView() ));
                        },
                      child: Container(
                        color: TColor.card,
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: ClipRect(
                          child: Image.asset(
                            watchArr[index].toString(),
                            width: media.width * 0.33,
                            height: media.width * 0.5,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

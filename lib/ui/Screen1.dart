import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta/bloc/highlights_bloc.dart';
import 'package:insta/bloc/insta_bloc.dart';
import 'package:insta/bloc/post_bloc.dart';
import 'package:insta/repositery/model/highlights.dart';
import 'package:insta/repositery/model/instamodel.dart';
import 'package:insta/repositery/model/postmodel.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late InstaModel insta;
  late Highlights highlight;
  late Post posts;

  String k_m_b_generator(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)} K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)} K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)} M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)} B";
    } else {
      return num.toString();
    }
  }

  @override
  void initState() {
    BlocProvider.of<InstaBloc>(context).add(fetchInstaEvent());
    BlocProvider.of<HighlightsBloc>(context).add(fetchHighlightsEvent());
    BlocProvider.of<PostBloc>(context).add(fetchPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 2,
        child: BlocBuilder<InstaBloc, InstaState>(
          builder: (context, state) {
            if (state is Instablocloading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is Instablocerror) {
              return RefreshIndicator(
                  child: Center(child: Text('error')),
                  onRefresh: () async {
                    return BlocProvider.of<InstaBloc>(context)
                        .add(fetchInstaEvent());
                  });
            }
            if (state is Instablocloaded) {

              insta = BlocProvider.of<InstaBloc>(context).instamodel;
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, top: 10.h),
                    child: SafeArea(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 25.sp,
                              ),
                              Text(
                                insta.data!.fullName.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.64,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20.0.w),
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                  size: 25.sp,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 98.w,
                                height: 98.h,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF253D84),
                                  shape: OvalBorder(
                                    side: BorderSide(
                                        width: 1.15, color: Color(0xFF212121)),
                                  ),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.flag_circle_rounded,
                                  size: 50.sp,
                                  color: Colors.white,
                                )),
                              ),
                              Column(
                                children: [
                                  Text(
                                    insta.data!.mediaCount.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.64,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Text('Posts',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                k_m_b_generator(
                                    double.parse(insta.data!.followerCount.toString())
                                ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.64,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Text('Followers',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 15.0.w),
                                child: Column(
                                  children: [
                                    Text(
                                      insta.data!.followingCount.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.64,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    Text('Following',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            insta.data!.username.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.64,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text('Local businness',
                              style: TextStyle(
                                color: Color(0xFF8E8E8E),
                                fontSize: 16.05,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              )),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text('www.website.com',
                              style: TextStyle(
                                color: Color(0xFFD4E0ED),
                                fontSize: 17.20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 112.w,
                                height: 33.h,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF4192EF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.73),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Follow',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.05,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 112.w,
                                height: 33.h,
                                decoration: ShapeDecoration(
                                    color: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.15,
                                          color: Color(0xFF343434)),
                                      borderRadius: BorderRadius.circular(5.73),
                                    )),
                                child: Center(
                                  child: Text(
                                    'Message',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.05,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 112.w,
                                height: 33.h,
                                decoration: ShapeDecoration(
                                    color: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.15,
                                          color: Color(0xFF343434)),
                                      borderRadius: BorderRadius.circular(5.73),
                                    )),
                                child: Center(
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.05,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20.0.w),
                                child: Container(
                                  width: 36.w,
                                  height: 33.h,
                                  decoration: ShapeDecoration(
                                    color: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.15,
                                          color: Color(0xFF343434)),
                                      borderRadius: BorderRadius.circular(5.73),
                                    ),
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.white,
                                  )),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 100.h,
                            child: BlocBuilder<HighlightsBloc, HighlightsState>(
                              builder: (context, state) {
                                if (state is Highlightsblocloading) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                if (state is Highlightsblocerror) {
                                  return RefreshIndicator(
                                      child: Center(
                                          child: Text(
                                        'error',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      onRefresh: () async {
                                        return BlocProvider.of<HighlightsBloc>(
                                                context)
                                            .add(fetchHighlightsEvent());
                                      });
                                }
                                if (state is Highlightsblocloaded) {
                                  highlight =
                                      BlocProvider.of<HighlightsBloc>(context)
                                          .highlights;
                                  return ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: highlight.data!.items!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 73.w,
                                            height: 73.h,
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1.15,
                                                    color: Color(0xFF505050)),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        113.52),
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  highlight
                                                      .data!
                                                      .items![index]
                                                      .coverMedia!
                                                      .croppedImageVersion!
                                                      .url
                                                      .toString()),
                                            ),
                                          ),
                                          Text(
                                            highlight.data!.items![index].title
                                                .toString(),
                                            style: TextStyle(
                                              color: Color(0xFFFAFAFA),
                                              fontSize: 14.91,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: 20.w,
                                      );
                                    },
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ])),
                  ),
                  Container(
                    width: 430,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.15,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF262626),
                        ),
                      ),
                    ),
                  ),
                  TabBar(
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerHeight: 1.h,
                      labelColor: Colors.white,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.menu,
                            size: 50.sp,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.person_pin_outlined,
                            size: 40.sp,
                          ),
                        ),
                      ]),
                  Expanded(
                    child: TabBarView(children: [
                      BlocBuilder<PostBloc, PostState>(
                        builder: (context, state) {
                          if (state is Postblocloading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (state is Postblocerror) {
                            return RefreshIndicator(
                                child: Center(
                                    child: Text(
                                  'error',
                                  style: TextStyle(color: Colors.white),
                                )),
                                onRefresh: () async {
                                  return BlocProvider.of<PostBloc>(context)
                                      .add(fetchPostEvent());
                                });
                          }
                          if (state is Postblocloaded) {
                            posts = BlocProvider.of<PostBloc>(context).posts;
                            return GridView.count(
                                padding: EdgeInsets.zero,
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                children: List.generate(
                                 posts.data!.items!.length,
                                  (index) {
                                    return Container(
                                      width: 140.19.w,
                                      height: 190.19.h,
                                      child: Image.network(fit: BoxFit.fill,
                                        posts.data!.items![index].thumbnailUrl.toString(),
                                      ),
                                    );

                                  },
                                ));
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      Container(
                        color: Colors.red,
                      )
                    ]),
                  )
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}

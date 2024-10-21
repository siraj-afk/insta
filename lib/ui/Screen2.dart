import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta/repositery/model/Followers.dart';

import '../bloc/followers_bloc.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  late Followers followers;

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
    BlocProvider.of<FollowersBloc>(context).add(fetchFollowersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15.0.sp),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0.sp),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        'Mr beast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.64,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TabBar(
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 1.h,
                    labelColor: Colors.white,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: Text(
                          'Followers',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Following',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ]),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0.w, top: 20.h),
                        child: BlocBuilder<FollowersBloc, FollowersState>(
                            builder: (context, state) {
                          if (state is Followersblocloading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (state is Followersblocerror) {
                            return RefreshIndicator(
                                child: Center(
                                    child: Text(
                                  'error',
                                  style: TextStyle(color: Colors.white),
                                )),
                                onRefresh: () async {
                                  return BlocProvider.of<FollowersBloc>(context)
                                      .add(fetchFollowersEvent());
                                });
                          }
                          if (state is Followersblocloaded) {
                            followers = BlocProvider.of<FollowersBloc>(context)
                                .followers;
                            return ListView.separated(
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    ClipOval(
                                        child: Image.asset(
                                      'assets/img.png',
                                      width: 60.w,
                                      height: 60.h,
                                      fit: BoxFit.cover,
                                    )),
                                    SizedBox(
                                      width: 30.w,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'beast',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.64,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        Text('slayer',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.20,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      width: 120.w,
                                    ),
                                    Container(
                                      width: 112.37,
                                      height: 33.25,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF4192EF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.73),
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
                                    )
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 10.h,
                                );
                              },
                            );
                          } else {
                            return SizedBox();
                          }
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0.w, top: 20.h),
                        child: ListView.separated(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                ClipOval(
                                    child: Image.asset(
                                  'assets/img_1.png',
                                  width: 60.w,
                                  height: 60.h,
                                  fit: BoxFit.cover,
                                )),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'don',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.64,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    Text('impo',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width: 120.w,
                                ),
                                Container(
                                  width: 112.37,
                                  height: 33.25,
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
                                )
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10.h,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

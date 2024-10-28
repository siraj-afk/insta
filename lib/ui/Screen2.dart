import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta/bloc/following_bloc.dart';
import 'package:insta/repositery/model/Followers.dart';
import 'package:insta/repositery/model/Followingmodel.dart';

import '../bloc/followers_bloc.dart';
import 'Screen3.dart';

class Screen2 extends StatefulWidget {
  final String name;
  const Screen2({super.key, required this.name});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  late Followers followers;
  late Following following;

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
    BlocProvider.of<FollowersBloc>(context).add(fetchFollowersEvent(id: widget.name));
    BlocProvider.of<FollowingBloc>(context).add(fetchFollowingEvent(id: widget.name));
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
                        widget.name.toString(),
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
                                      .add(fetchFollowersEvent(id: widget.name));
                                });
                          }
                          if (state is Followersblocloaded) {
                            followers = BlocProvider.of<FollowersBloc>(context)
                                .followers;
                            return ListView.separated(
                              itemCount: followers.data!.items!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading:  ClipOval(
                                            child: Image.network(
                                          followers.data!.items![index].profilePicUrl.toString(),
                                          width: 60.w,
                                          height: 60.h,
                                          fit: BoxFit.cover,
                                        )),
                                  title:  GestureDetector(onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen3(username: followers.data!.items![index].username.toString(),)));
                                  },
                                    child: Text(
                                      followers.data!.items![index].fullName.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  subtitle:    Text(followers.data!.items![index].username.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),),
                                  trailing:  Container(
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
                                  ),
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
                        child: BlocBuilder<FollowingBloc, FollowingState>(
                            builder: (context, state) {
                              if (state is Followingblocloading) {
                                return Center(child: CircularProgressIndicator());
                              }
                              if (state is Followingblocerror) {
                                return RefreshIndicator(
                                    child: Center(
                                        child: Text(
                                          'error',
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    onRefresh: () async {
                                      return BlocProvider.of<FollowingBloc>(context)
                                          .add(fetchFollowingEvent(id: widget.name));
                                    });
                              }
                              if (state is Followingblocloaded) {
                                following = BlocProvider.of<FollowingBloc>(context)
                                    .following;
                                return ListView.separated(
                                  itemCount: following.data!.items!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(leading:     ClipOval(
                                                child: Image.network(
                                                  following.data!.items![index].profilePicUrl.toString(),
                                                  width: 60.w,
                                                  height: 60.h,
                                                  fit: BoxFit.cover,
                                                )),title: GestureDetector(onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen3(username: following.data!.items![index].username.toString(),)));

                                    },
                                                  child: Text(
                                                  following.data!.items![index].fullName.toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                  ),
                                                                                                ),
                                                ), subtitle: Text(following.data!.items![index].username.toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  )),trailing:  Container(
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
                                    ),);


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

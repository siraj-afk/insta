import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0.w,top: 10.h),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_ios,color: Colors.white,size: 25.sp,),
                        Text('user_name',style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.64,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),),
                        Padding(
                          padding:  EdgeInsets.only(right: 20.0.w),
                          child: Icon(Icons.more_horiz,color: Colors.white,size: 25.sp,),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 98.w,
                          height: 98.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFF253D84),
                            shape: OvalBorder(
                              side: BorderSide(width: 1.15, color: Color(0xFF212121)),
                            ),
                        ),
                          child: Center(child: Icon(Icons.flag_circle_rounded,size: 50.sp,color: Colors.white,)),
                        ),
                        Column(
                          children: [
                            Text('129', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.64,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),),
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
                            Text('3680', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.64,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),),
                            Text('Followres',
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
                          padding:  EdgeInsets.only(right: 15.0.w),
                          child: Column(
                            children: [
                              Text('230', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.64,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),),
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
                    SizedBox(height: 20.h,),
                    Text('Name', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.64,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),),
                    SizedBox(height: 5.h,),
                    Text('Local businness', style: TextStyle(
                      color: Color(0xFF8E8E8E),
                      fontSize: 16.05,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    )),
                    SizedBox(height: 5.h,),
                    Text('www.website.com', style: TextStyle(
                      color: Color(0xFFD4E0ED),
                      fontSize: 17.20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    )),
                    SizedBox(height: 30.h,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            child: Text('Follow', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.05,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),),
                          ),
                        ),
                        Container(
                          width: 112.w,
                          height: 33.h,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.15, color: Color(0xFF343434)),
                              borderRadius: BorderRadius.circular(5.73),
                            )),
                          child: Center(
                            child: Text('Message', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.05,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),),
                          ),
                        ),
                        Container(
                          width: 112.w,
                          height: 33.h,
                          decoration: ShapeDecoration(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.15, color: Color(0xFF343434)),
                                borderRadius: BorderRadius.circular(5.73),
                              )),
                          child: Center(
                            child: Text('Email', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.05,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 20.0.w),
                          child: Container(
                            width: 36.w,
                            height: 33.h,
                            decoration: ShapeDecoration(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.15, color: Color(0xFF343434)),
                                borderRadius: BorderRadius.circular(5.73),
                              ),
                          ),
                            child: Center(child: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    SizedBox(height: 100.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                          itemBuilder:(context, index) {
                          return Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 73.w,
                                height: 73.h,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.15, color: Color(0xFF505050)),
                                borderRadius: BorderRadius.circular(113.52),
                              ),
                              ),
                                child: Container(
                                  width: 64.w,
                                  height: 64.h,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF7B6FC5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(113.52),
                                    ),
                                  ),
                                  child: Center(child: Icon(Icons.add,size: 30,color: Colors.white,)),
                                ),
                              ),
                              Text('Highlight', style: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 14.91,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),)
                            ],

                          );

                          }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 20.w,);
                          },),
                    ),
                    SizedBox(height: 10.h,),
                ]
                )
              ),
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
              indicatorColor: Colors.red,
              indicatorSize:TabBarIndicatorSize.tab ,

                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelColor: Colors.white,
                dividerColor: Colors.transparent,

                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.menu,size: 50.sp,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.person_pin_outlined,size: 40.sp,
                    ),
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                Container(color: Colors.white,),
                Container(color: Colors.red,)
              ]),
            )

          ],
        ),
      ),

    );
  }
}

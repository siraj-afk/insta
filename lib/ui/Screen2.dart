import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
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
                      Icon(Icons.arrow_back,color: Colors.white,),
                      SizedBox(width: 30.w,),
                      Text('Mr beast', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.64,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 15.h,),
                TabBar(
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 1.h,
                    labelColor: Colors.white,
                    dividerColor: Colors.transparent,
                    tabs:[
                      Tab(
                        child: Text('Followers', style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),),
                      ),
                      Tab(
                        child: Text('Following', style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),),
                      ),
                ]),
                Expanded(child: TabBarView(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 15.0.w,top: 20.h),
                      child: ListView.separated(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Icon(Icons.ac_unit,size: 40,color: Colors.white,),
                            SizedBox(width: 30.w,),
                            Column(
                              children: [
                                Text('beast',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.64,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),),
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
                            SizedBox(width: 130.w,),
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
                                child: Text('Follow', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.05,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),),
                              ),
                            )
                          ],
                        );
                      }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10.h,); },),
                    )
                  ],
                ),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dbms_assignment/pages/mobile_home_page.dart';
import 'package:dbms_assignment/pages/web_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SideBarList extends StatelessWidget {
  bool withName;
  SideBarList({Key? key, this.withName = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: withName ? Colors.black : Colors.transparent,
      child: Padding(
        padding: withName
            ? EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h)
            : EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                withName ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: withName
                    ? Row(
                        children: [
                          Icon(
                            Icons.house_outlined,
                            color: Colors.white,
                            size: 50.sp,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          const Text(
                            'Refresh',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.house_outlined,
                        color: Colors.white,
                        size: 50.sp,
                      ),
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  withName
                      ? Get.to(() => MobileHomePage(pageNo: 0))
                      : Get.to(() => WebHomePage(
                            pageNo: 0,
                          ));
                },
                child: withName
                    ? Row(
                        children: [
                          Icon(
                            Icons.table_chart,
                            color: Colors.white,
                            size: 50.sp,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          const Text(
                            'Inventory',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.table_chart,
                        color: Colors.white,
                        size: 50.sp,
                      ),
              ),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  withName
                      ? Get.to(() => MobileHomePage(pageNo: 1))
                      : Get.to(() => WebHomePage(
                            pageNo: 1,
                          ));
                },
                child: withName
                    ? Row(
                        children: [
                          Icon(
                            Icons.download_outlined,
                            color: Colors.white,
                            size: 50.sp,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          const Text(
                            'Arrival',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.download_outlined,
                        color: Colors.white,
                        size: 50.sp,
                      ),
              ),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  withName
                      ? Get.to(() => MobileHomePage(pageNo: 2))
                      : Get.to(() => WebHomePage(
                            pageNo: 2,
                          ));
                },
                child: withName
                    ? Row(
                        children: [
                          Icon(
                            Icons.upload_outlined,
                            color: Colors.white,
                            size: 50.sp,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          const Text(
                            'Departure',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.upload_outlined,
                        color: Colors.white,
                        size: 50.sp,
                      ),
              ),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  withName
                      ? Get.to(() => MobileHomePage(pageNo: 3))
                      : Get.to(() => WebHomePage(
                            pageNo: 3,
                          ));
                },
                child: withName
                    ? Row(
                        children: [
                          Icon(
                            Icons.production_quantity_limits_outlined,
                            color: Colors.white,
                            size: 50.sp,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          const Text(
                            'Product',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.production_quantity_limits_outlined,
                        color: Colors.white,
                        size: 50.sp,
                      ),
              ),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  withName
                      ? Get.to(() => MobileHomePage(pageNo: 4))
                      : Get.to(() => WebHomePage(
                            pageNo: 4,
                          ));
                },
                child: withName
                    ? Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 50.sp,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          const Text(
                            'Employees',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50.sp,
                      ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ]),
      ),
    );
  }
}

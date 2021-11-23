import 'package:dbms_assignment/functions/supabase.dart';
import 'package:dbms_assignment/pages/web_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeleteEntryDialog extends StatelessWidget {
  var tableName;
  var id;
  var pageNo;
  DeleteEntryDialog({Key? key, this.id, this.tableName, this.pageNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 500.w,
        height: 200.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Are you sure you want to delete the entry'),
            Text('with id $id  from list $tableName'),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.red,
                        minimumSize: Size(100.w, 47.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.r))),
                    onPressed: () {
                      Navigator.of(context).pop();
                      SupabaseManager supabaseManager = SupabaseManager();
                      supabaseManager.deleteData(tableName, id);
                      Get.back();
                      Get.to(() => WebHomePage(
                            pageNo: pageNo,
                          ));
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    )),
                SizedBox(
                  width: 20.w,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.red,
                        primary: Colors.green,
                        minimumSize: Size(100.w, 47.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.r))),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dbms_assignment/functions/supabase.dart';
import 'package:dbms_assignment/pages/web_home_page.dart';
import 'package:dbms_assignment/widgets/add_row_dialog.dart';
import 'package:dbms_assignment/widgets/column_name_row.dart';
import 'package:dbms_assignment/widgets/delete_entry_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArrivalListCards extends StatelessWidget {
  var width;
  Map inventoryList;
  var tableName;
  var pageNo;
  ArrivalListCards(
      {Key? key,
      this.width,
      this.inventoryList = const {},
      this.tableName,
      this.pageNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.sp),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddRowDialog(
                        tableName: tableName,
                        pageNo: pageNo,
                        edit: true,
                        id: inventoryList['id'],
                      );
                    });
                Get.back();
                Get.to(() => WebHomePage(
                      pageNo: pageNo,
                    ));
              },
              child: Icon(
                Icons.edit,
                size: 30.sp,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: Colors.grey.shade200,
                ),
                // width: width - 381.w,
                // height: 70.h,
                child: Center(
                  child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: const TableBorder(
                          verticalInside: BorderSide(
                              width: 1,
                              color: Colors.black26,
                              style: BorderStyle.solid)),
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TableRow(
                          children: [
                            Center(child: Text(inventoryList['id'].toString())),
                            Center(
                                child: Text(
                                    inventoryList['product_id'].toString())),
                            Center(
                                child: Text(
                                    inventoryList['reference_no'].toString())),
                            Center(
                                child: Text(
                                    inventoryList['arrival_date'].toString())),
                            Center(
                                child: Text(
                                    inventoryList['arrival_time'].toString())),
                            Center(
                                child: Text(
                                    inventoryList['employee_id'].toString())),
                            Center(
                                child:
                                    Text(inventoryList['quantity'].toString())),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).pop();
                showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteEntryDialog(
                          tableName: tableName.toString(),
                          id: inventoryList['id'],
                          pageNo: pageNo);
                    });
              },
              child: Icon(
                Icons.delete,
                size: 30.sp,
                color: Colors.red,
              ),
            ),
          ],
        ));
  }
}

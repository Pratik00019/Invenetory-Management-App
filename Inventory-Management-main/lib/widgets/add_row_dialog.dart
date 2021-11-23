import 'dart:convert';

import 'package:dbms_assignment/functions/map.dart';
import 'package:dbms_assignment/functions/supabase.dart';
import 'package:dbms_assignment/pages/web_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddRowDialog extends StatelessWidget {
  SupabaseManager supabaseManager = SupabaseManager();
  String tableName;
  int pageNo;
  bool edit;
  var id;
  AddRowDialog(
      {Key? key,
      this.tableName = '',
      this.pageNo = 0,
      this.edit = false,
      this.id})
      : super(key: key);

  List<Map> listOfMap = [
    inventoryMap,
    arrivalMap,
    departureMap,
    productMap,
    employeeMap
  ];
  Map uploadMap = {};

  @override
  Widget build(BuildContext dialogcontext) {
    uploadMap = {};
    return Dialog(
      // clipBehavior: Clip.hardEdge,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          width: 500.sp,
          // height: 600.sp,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('You are editing $tableName'),
              edit
                  ? Text('with id $id')
                  : const Text('The id will be automatically generated'),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(30.sp),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3,
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.sp,
                    crossAxisSpacing: 20.sp),
                itemBuilder: (context, index) {
                  var data = listOfMap[pageNo].keys;

                  return TextField(
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 10),
                      labelStyle: const TextStyle(fontSize: 10),

                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10.sp)),
                      hintText: data.toList()[index],
                      labelText: data.toList()[index],
                      //helperText: data.toString(),
                    ),
                    onChanged: (value) {
                      uploadMap[data.toList()[index]] = value;
                    },
                  );
                },
                itemCount: listOfMap[pageNo].length,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: const Color(0xFF009FAD),
                          maximumSize: Size(140, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r))),
                      onPressed: () {
                        Navigator.of(dialogcontext).pop();
                        edit
                            ? supabaseManager.updateData(
                                tableName, id, uploadMap)
                            : supabaseManager.addData(tableName, uploadMap);
                        Get.back();
                        Get.to(() => WebHomePage(
                              pageNo: pageNo,
                            ));
                        print('this is the upload map ' + uploadMap.toString());
                      },
                      child: const Text('Save',
                          style: TextStyle(color: Colors.white))),
                  SizedBox(
                    width: 20.w,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.red,
                          primary: Colors.white,
                          maximumSize: Size(140, 60),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(15.r))),
                      onPressed: () {
                        Navigator.of(dialogcontext).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dbms_assignment/functions/supabase.dart';
import 'package:dbms_assignment/widgets/add_row_dialog.dart';
import 'package:dbms_assignment/widgets/column_name_row.dart';
import 'package:dbms_assignment/widgets/cards/inventory_cards.dart';
import 'package:dbms_assignment/widgets/table_builder.dart';
import 'package:dbms_assignment/widgets/side_bar_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WebHomePage extends StatefulWidget {
  int pageNo;
  WebHomePage({Key? key, this.pageNo = 0}) : super(key: key);

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  SupabaseManager supabaseManager = SupabaseManager();
  List inventoryList = [];
  bool isloading = false;
  String searchPattern = '';
  List<Widget> topRowWidgetList = [
    inventoryPageColumn(),
    arrivalPageColumn(),
    departurePageColumn(),
    productPageColumn(),
    employeePageColumn()
  ];
  List tableName = [
    'inventory1',
    'arrival1',
    'departure1',
    'product1',
    'employee1'
  ];
  getData() async {
    var temp = await supabaseManager.getData(tableName[widget.pageNo]);
    setState(() {
      inventoryList = temp;
      isloading = false;
    });
  }

  void initState() {
    super.initState();
    searchPattern = '';
    //Mysql().getConnection().then((value) => print('connection done'));
    getData();
    isloading = true;
    // supabaseManager
    //     .addData('inventory', {'product_id': 1, 'available_amount': 3});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add Row'),
        backgroundColor: Colors.grey,
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddRowDialog(
                  tableName: tableName[widget.pageNo],
                  pageNo: widget.pageNo,
                );
              });
        },
      ),
      body: Row(
        // mainAxisSize: MainAxisSize.max,
        //this row will contain only 2 childs first side bar and second rest of the content
        children: [
          //below container is for side bar
          Container(
            width: 80.w,
            // height: height,
            color: Colors.grey.shade900,
            child: SideBarList(),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // alignment: Alignment.centerLeft,
                    height: 90.h,
                    color: Colors.grey.shade100,
                    width: width - 80.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Text(
                      'Inventory Management',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  //search box
                  // Container(
                  //   padding: EdgeInsets.all(10.w),
                  //   height: 50.h,
                  //   width: width - 200,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10.r),
                  //       color: Colors.white,
                  //       boxShadow: [
                  //         BoxShadow(
                  //             color: Colors.black.withOpacity(0.1),
                  //             spreadRadius: 2.r,
                  //             blurRadius: 5.r)
                  //       ]),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Icon(
                  //         Icons.search,
                  //         size: 22.sp,
                  //       ),
                  //       SizedBox(width: 20.w),
                  //       SizedBox(
                  //         width: 250.w,
                  //         child: TextField(
                  //           decoration: InputDecoration(
                  //               border: InputBorder.none,
                  //               hintStyle: TextStyle(
                  //                 color: Colors.grey,
                  //                 fontWeight: FontWeight.normal,
                  //                 fontStyle: FontStyle.normal,
                  //                 fontSize: 22.sp,
                  //               ),
                  //               hintText: 'Search '),
                  //           onChanged: (value) {
                  //             setState(() {
                  //               searchPattern = value;
                  //               print(searchPattern);
                  //             });
                  //           },
                  //           onEditingComplete: () {
                  //             supabaseManager.searchData(
                  //                 tableName[widget.pageNo], searchPattern);
                  //           },
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Column(
                    children: [
                      Text('You are viewing the table: ' +
                          tableName[widget.pageNo].toString()),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 160.w, vertical: 20.h),
                        child: topRowWidgetList[widget.pageNo],
                      ),
                      //actual list of cards to pe placed as the child of the list view builder below
                      isloading
                          ? const Center(child: CircularProgressIndicator())
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 120.w, vertical: 2.h),
                              child: SizedBox(
                                  height: 400,
                                  child: tableBuilder(width, inventoryList,
                                      widget.pageNo, tableName[widget.pageNo])),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

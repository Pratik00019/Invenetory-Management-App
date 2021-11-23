import 'package:dbms_assignment/functions/supabase.dart';
import 'package:dbms_assignment/widgets/add_row_dialog.dart';
import 'package:dbms_assignment/widgets/column_name_row.dart';
import 'package:dbms_assignment/widgets/table_builder.dart';
import 'package:dbms_assignment/widgets/side_bar_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileHomePage extends StatefulWidget {
  int pageNo;
  MobileHomePage({Key? key, this.pageNo = 0}) : super(key: key);

  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  SupabaseManager supabaseManager = SupabaseManager();
  List inventoryList = [];
  bool isloading = false;
  List<Widget> topRowWidgetList = [
    inventoryPageColumn(),
    arrivalPageColumn(),
    departurePageColumn(),
    productPageColumn(),
    employeePageColumn()
  ];
  List tableName = ['inventory', 'arrival', 'departure', 'product', 'employee'];
  getData() async {
    var temp = await supabaseManager.getData(tableName[widget.pageNo]);
    setState(() {
      inventoryList = temp;
      isloading = false;
    });
  }

  void initState() {
    super.initState();
    //Mysql().getConnection().then((value) => print('connection done'));
    getData();
    isloading = true;
    // supabaseManager
    //     .addData('inventory', {'product_id': 1, 'available_amount': 3});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add Row'),
        backgroundColor: Colors.grey,
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddRowDialog(tableName: tableName[widget.pageNo]);
              });
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Inventory Management',
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: SideBarList(
          withName: true,
        ),
      ),

      //actual list of cards to pe placed as the child of the list view builder below

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: topRowWidgetList[widget.pageNo],
          ),
          isloading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: tableBuilder(width, inventoryList, widget.pageNo,
                      tableName[widget.pageNo]),
                ),
        ],
      ),
    );
  }
}

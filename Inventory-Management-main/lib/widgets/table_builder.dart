import 'package:dbms_assignment/widgets/cards/arrival_list_cards.dart';
import 'package:dbms_assignment/widgets/cards/departure_list_cards.dart';
import 'package:dbms_assignment/widgets/cards/employee_list_cards.dart';
import 'package:dbms_assignment/widgets/cards/inventory_cards.dart';
import 'package:dbms_assignment/widgets/cards/product_list_cards.dart';
import 'package:flutter/material.dart';

Widget tableBuilder(width, List inventoryList, pageNo, tableName) {
  return ListView.builder(
    shrinkWrap: true,
    physics: AlwaysScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      Map data = inventoryList[index];
      if (pageNo == 1) {
        return ArrivalListCards(
          width: width,
          inventoryList: data,
          pageNo: pageNo,
          tableName: tableName,
        );
      } else if (pageNo == 2) {
        return DepartureListCards(
          width: width,
          inventoryList: data,
          pageNo: pageNo,
          tableName: tableName,
        );
      } else if (pageNo == 3) {
        return ProductListCards(
          width: width,
          inventoryList: data,
          pageNo: pageNo,
          tableName: tableName,
        );
      } else if (pageNo == 4) {
        return EmployeeListCards(
          width: width,
          inventoryList: data,
          pageNo: pageNo,
          tableName: tableName,
        );
      }
      return InventoryCards(
        width: width,
        inventoryList: data,
        pageNo: pageNo,
        tableName: tableName,
      );
    },
    itemCount: inventoryList.length,
  );
}

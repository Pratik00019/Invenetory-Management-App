import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget inventoryPageColumn() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.sp),
      color: Colors.grey.shade200,
    ),
    // width: width - 250,
    height: 70.h,
    child: Center(
      child: Table(
        border: const TableBorder(
            verticalInside: BorderSide(
                width: 1, color: Colors.black26, style: BorderStyle.solid)),
        children: const [
          TableRow(
            children: [
              Center(child: Text('id')),
              Center(child: Text('product_id')),
              Center(child: Text('arrival_id')),
              Center(child: Text('departure_id')),
              Center(child: Text('available_amount')),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget arrivalPageColumn() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.sp),
      color: Colors.grey.shade200,
    ),
    // width: width - 250,
    height: 70.h,
    child: Center(
      child: Table(
        border: const TableBorder(
            verticalInside: BorderSide(
                width: 1, color: Colors.black26, style: BorderStyle.solid)),
        children: const [
          TableRow(
            children: [
              Center(child: Text('id')),
              Center(child: Text('product_id')),
              Center(child: Text('reference_no')),
              Center(child: Text('arrival_date')),
              Center(child: Text('arrival_time')),
              Center(child: Text('employee_id')),
              Center(child: Text('quantity')),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget departurePageColumn() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.sp),
      color: Colors.grey.shade200,
    ),
    // width: width - 250,
    height: 70.h,
    child: Center(
      child: Table(
        border: const TableBorder(
            verticalInside: BorderSide(
                width: 1, color: Colors.black26, style: BorderStyle.solid)),
        children: const [
          TableRow(
            children: [
              Center(child: Text('id')),
              Center(child: Text('product_id')),
              Center(child: Text('reference_no')),
              Center(child: Text('departure_date')),
              Center(child: Text('departure_time')),
              Center(child: Text('employee_id')),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget productPageColumn() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.sp),
      color: Colors.grey.shade200,
    ),
    // width: width - 250,
    height: 70.h,
    child: Center(
      child: Table(
        border: const TableBorder(
            verticalInside: BorderSide(
                width: 1, color: Colors.black26, style: BorderStyle.solid)),
        children: const [
          TableRow(
            children: [
              Center(child: Text('id')),
              Center(child: Text('product_name')),
              Center(child: Text('description')),
              Center(child: Text('fragile')),
              Center(child: Text('perishable')),
              Center(child: Text('price')),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget employeePageColumn() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.sp),
      color: Colors.grey.shade200,
    ),
    // width: width - 250,
    height: 70.h,
    child: Center(
      child: Table(
        border: const TableBorder(
            verticalInside: BorderSide(
                width: 1, color: Colors.black26, style: BorderStyle.solid)),
        children: const [
          TableRow(
            children: [
              Center(child: Text('id')),
              Center(child: Text('first_name')),
              Center(child: Text('middle_name')),
              Center(child: Text('last_name')),
              Center(child: Text('date_of_birth')),
              Center(child: Text('mobile_no')),
              Center(child: Text('aadhar_no')),
              // Center(child: Text('addresss')),
            ],
          ),
        ],
      ),
    ),
  );
}

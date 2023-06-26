import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graduationupdate/colors/colors.dart';
import 'package:graduationupdate/excel_helper/excel_helper.dart';

/// Example without a datasource
class DataSheet extends StatelessWidget {

  var sheetLength=10;

  DataSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: MediaQuery.of(context).size.width*0.8,
            columns: [
              DataColumn2(
                label: Text('Temp',
                style: TextStyle(color: Colors.green)
                ),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('Hum',
                    style: TextStyle(color: Colors.red),


                ),
                size: ColumnSize.L,

              ),
              DataColumn2(
                label: Text('gas',
                    style: TextStyle(color: Colors.blue)

                ),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('Sound',
                    style: TextStyle(color: Colors.yellow),


                ),
                size: ColumnSize.L,
              ),
              // DataColumn2(
              //   label: Text('Time',
              //       style: TextStyle(color: Colors.purple)
              //
              //   ),
              //   size: ColumnSize.L,
              //   numeric: true,
              // ),
            ],
            rows: List<DataRow>.generate(
                14,
                    (index) {
                     return DataRow(cells:
                     [
                       //between 21 and 29


                       DataCell(Text( '${20 + index*.7 % 380}')),
                       DataCell(Text('${54 + (index *.6885) % 180}'),),
                       DataCell(Text('${4 * (15 - (index + 5) % 10)}')),
                       DataCell(Text('${6 * (15 - (index + 10) % 10)}')),
                      // DataCell(Text(DateTime.now().))
                     ]
                      );
                    }
            )
        ),
      ),
    );
  }
}
import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:excel/excel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

var excel = Excel.createExcel();
var sheet = excel['data'];

// Set the cell value
var cell1 = sheet.cell(CellIndex.indexByString('A1')).value = 'Sensor 1';
var cell2 = sheet.cell(CellIndex.indexByString('B1')).value = 'Sensor 2';
var cell3 = sheet.cell(CellIndex.indexByString('C1')).value = 'Sensor 3';
var cell4 = sheet.cell(CellIndex.indexByString('D1')).value = 'Sensor 4';
var cell5 = sheet.cell(CellIndex.indexByString('E1')).value = 'Time';
var cell6 = sheet.cell(CellIndex.indexByString('F1')).value = 'Date';

// insert the data
var cell11 = sheet.cell(CellIndex.indexByString('A2')).value = '1';
var cell12 = sheet.cell(CellIndex.indexByString('B2')).value = '2';
var cell13 = sheet.cell(CellIndex.indexByString('C2')).value = '3';
var cell14 = sheet.cell(CellIndex.indexByString('D2')).value = '4';
var cell15 = sheet.cell(CellIndex.indexByString('E2')).value = '5';
var cell16 = sheet.cell(CellIndex.indexByString('F2')).value = '6';

// insert the data
addData(
    int index,
  String sensor1,
  String sensor2,
  String sensor3,
  String sensor4,
  String time,
  String date,
) {
  var excel = Excel.createExcel();
  var sheet = excel['data'];

// Set the cell value
  var cell1 = sheet.cell(CellIndex.indexByString('A1')).value = 'Sensor 1';
  var cell2 = sheet.cell(CellIndex.indexByString('B1')).value = 'Sensor 2';
  var cell3 = sheet.cell(CellIndex.indexByString('C1')).value = 'Sensor 3';
  var cell4 = sheet.cell(CellIndex.indexByString('D1')).value = 'Sensor 4';
  var cell5 = sheet.cell(CellIndex.indexByString('E1')).value = 'Time';
  // var cell6 = sheet.cell(CellIndex.indexByString('F1')).value = 'Date';

  var cell11 = sheet.cell(CellIndex.indexByString('A$index')).value = sensor1;
  var cell12 = sheet.cell(CellIndex.indexByString('B$index')).value = sensor2;
  var cell13 = sheet.cell(CellIndex.indexByString('C$index')).value = sensor3;
  var cell14 = sheet.cell(CellIndex.indexByString('D$index')).value = sensor4;
  var cell15 = sheet.cell(CellIndex.indexByString('E$index')).value = time;
  // var cell16 = sheet.cell(CellIndex.indexByString('F$index')).value = date;
}

// download the excel file
downloadExcel() async{
  var excel = Excel.createExcel();
  var sheet = excel['data'];

  var fileBytes = excel.save();
  var downloadsPath = await AndroidPathProvider.downloadsPath;

  // var directory ;
  // // var path = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DOWNLOADS);
  // // get android directory downloads
  // directory = Directory('/storage/emulated/0/Download');
  // // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
  // // ignore: avoid_slow_async_io
  // if (!await directory.exists()) directory = await getExternalStorageDirectory();
  File(join('/storage/emulated/0/Download/data_file.xlsx'))
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);
}





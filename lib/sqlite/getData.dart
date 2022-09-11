// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';


class GetData {
   static final String veritabaniAdi="todoapp.sqlite";
  
  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(),veritabaniAdi);

    if (await databaseExists(veritabaniYolu)) {
      print("Veritabani Zaten var");
    }else{
      // veritabani koypayalama işlemi

      ByteData data =await rootBundle.load("veritabani/$veritabaniAdi");
      List<int> bytes = data.buffer.asUint8List();
      await File(veritabaniYolu).writeAsBytes(bytes,flush:true);
      print("Veritabani kopyalandi");

      
    }

    return openDatabase(veritabaniYolu);
  }
}
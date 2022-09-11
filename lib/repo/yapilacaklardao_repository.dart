import 'package:todo/entity/yapilacaklar.dart';
import 'package:todo/sqlite/getData.dart';

class YapilacaklarDaoRepository {
  Future<void> yapilacakKayit(String yapilacak_is)async{
    var db = await GetData.veritabaniErisim();
    var bilgiler= Map<String,dynamic>();
    bilgiler["yapilacak_is"]=yapilacak_is;
    await db.insert("yapilacaklar", bilgiler);
  }

  Future<void> yapilacakGuncelle(int yapilacak_id,String yapilacak_is, )async {
    var db = await GetData.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["yapilacak_is"]= yapilacak_is;
    await db.update("yapilacaklar", bilgiler, where: "yapilacak_id = ?",whereArgs: [yapilacak_id]);
  }

  Future<List<Yapilacaklar>> yapilacakGetir() async{
    var db = await GetData.veritabaniErisim();
    List<Map<String,dynamic>> maps= await db.rawQuery("SELECT * FROM yapilacaklar");

    return List.generate(maps.length, (index) {
      var satir= maps[index];
      return Yapilacaklar(yapilacak_id: satir["yapilacak_id"], yapilacak_is:satir["yapilacak_is"]);
    });
  }
 Future<List<Yapilacaklar>> yapilacakAra(String aramaKelimesi) async{
    var db = await GetData.veritabaniErisim();
    List<Map<String,dynamic>> maps= await db.rawQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%aramaKelimesi'", );

    return List.generate(maps.length, (index) {
       var satir = maps[index];
      return Yapilacaklar(yapilacak_id:satir["yapilacak_id"],yapilacak_is:satir["yapilacak_is"]);
    });
       
    
  }

  Future<void> yapilacakSil(int yapilacak_id) async{
    var db= await GetData.veritabaniErisim();
    await db.delete("yapilacaklar", where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);
  }

}
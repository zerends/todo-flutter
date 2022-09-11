import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/entity/yapilacaklar.dart';
import 'package:todo/repo/yapilacaklardao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>> {
  AnasayfaCubit():super(<Yapilacaklar>[]);

  var yrepo=YapilacaklarDaoRepository();

  Future<void> yapilacakYukle() async{
    var liste= await yrepo.yapilacakGetir();
    emit(liste);
  }
  Future<void> ara(String aramaKelimesi) async {
    var liste = await yrepo.yapilacakAra(aramaKelimesi);
    emit(liste);

  }

  Future<void> sil(int kisi_id) async{
    await yrepo.yapilacakSil(kisi_id);
    await yapilacakYukle();
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repo/yapilacaklardao_repository.dart';

class YapilacakKayitCubit extends Cubit<void>{
  YapilacakKayitCubit(): super(0);

  var yrepo = YapilacaklarDaoRepository();
  Future<void> kayit(String yapilacak_is) async {
    await yrepo.yapilacakKayit(yapilacak_is);
    
  }
}
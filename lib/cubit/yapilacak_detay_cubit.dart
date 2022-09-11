import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repo/yapilacaklardao_repository.dart';

class YapilacakDetayCubit extends Cubit<void>{
  YapilacakDetayCubit(): super(0);

  var yrepo = YapilacaklarDaoRepository();
  Future<void> guncelle(int yapilacak_id,String yapilacak_is,) async {
    await yrepo.yapilacakGuncelle(yapilacak_id,yapilacak_is);
    
  }
  
}
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo/cubit/yapilacak_kayit_cubit.dart';

class YapilacakKayitSayfa extends StatefulWidget {
  const YapilacakKayitSayfa({Key? key}) : super(key: key);

  @override
  State<YapilacakKayitSayfa> createState() => _YapilacakKayitSayfaState();
}

class _YapilacakKayitSayfaState extends State<YapilacakKayitSayfa> {
  var tfis = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kayıt"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ 
                TextField(controller: tfis,decoration: const InputDecoration(hintText: "Yapilacak İş"),),
                ElevatedButton(onPressed: (){
                  context.read<YapilacakKayitCubit>().kayit(tfis.text);
                }, child: Text("Kaydet"))
              ],

            ),
          ),
        ));
  }
}

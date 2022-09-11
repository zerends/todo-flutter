
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo/cubit/yapilacak_detay_cubit.dart';
import 'package:todo/entity/yapilacaklar.dart';

class YapilacakDetay extends StatefulWidget {
  Yapilacaklar yapilacak;
  YapilacakDetay({required this.yapilacak});

  @override
  State<YapilacakDetay> createState() => _YapilacakDetayState();
}

class _YapilacakDetayState extends State<YapilacakDetay> {
  var tfis = TextEditingController();

  @override
  void initState() {
    super.initState();
    var yapilacak = widget.yapilacak;
    tfis.text = yapilacak.yapilacak_is;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Düzenle"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfis,
                decoration: InputDecoration(hintText: "Yapilacak Ad"),
              ),
              ElevatedButton(onPressed: () {
                context.read<YapilacakDetayCubit>().guncelle(widget.yapilacak.yapilacak_id,tfis.text,);
              }, child: const Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}

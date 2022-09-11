// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

import 'package:todo/cubit/anasayfa_cubit.dart';
import 'package:todo/entity/yapilacaklar.dart';
import 'package:todo/views/yapilacak_detay.dart';
import 'package:todo/views/yapilacak_kayit.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yapilacakYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (aramaSonucu) {
                  context.read<AnasayfaCubit>().ara(aramaSonucu);
                },
              )
            : const Text("Yapılacaklar"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                    context.read<AnasayfaCubit>().yapilacakYukle();
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<Yapilacaklar>>(
          builder: (context, yapilacaklarListesi) {
        if (yapilacaklarListesi.isNotEmpty) {
          return ListView.builder(
              itemCount: yapilacaklarListesi.length,
              itemBuilder: (context, indeks) {
                var yapilacak = yapilacaklarListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    YapilacakDetay(yapilacak: yapilacak)))
                        .then((value) {
                      context.read<AnasayfaCubit>().yapilacakYukle();
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("${yapilacak.yapilacak_is}",style: TextStyle(color: Colors.black, fontSize: 18, ),),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "${yapilacak.yapilacak_is} silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: () {
                                      context
                                          .read<AnasayfaCubit>()
                                          .sil(yapilacak.yapilacak_id);
                                    },
                                  ),
                                ));
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.black45,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          return const Center();
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const YapilacakKayitSayfa())).then(
              (value) => {context.read<AnasayfaCubit>().yapilacakYukle()});
        },
      ),
    );
  }
}

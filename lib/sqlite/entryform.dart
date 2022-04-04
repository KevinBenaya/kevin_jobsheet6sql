import 'package:flutter/material.dart';

import '../models/item.dart';

class EntryForm extends StatefulWidget {
  final Item? item;

  EntryForm(this.item);

  @override
  State<EntryForm> createState() => _EntryFormState(this.item);
}

class _EntryFormState extends State<EntryForm> {
  Item? item;

  _EntryFormState(this.item);
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController kodeBarangController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (item != null) {
      nameController.text = item!.name;
      priceController.text = item!.price.toString();
      stokController.text = item!.stok.toString();
      kodeBarangController.text = item!.kode;
    }
    return Scaffold(
      appBar: AppBar(
        title: item == null ? const Text('Tambah') : const Text('Ubah'),
        leading: const Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            //nama barang
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            //harga barang
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Harga Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: stokController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Stok Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: kodeBarangController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Kode Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),

            // membuat tombol button
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  // tombol simpan
                  Expanded(
                    child: ElevatedButton(
                      //color: Theme.of(context).primaryColorDark,
                      //textColor: Theme.of(context).primaryColorLight,
                      child: const Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if (item == null) {
                          // tambah data
                          item = Item(
                            nameController.text,
                            int.parse(priceController.text),
                            int.parse(stokController.text),
                            kodeBarangController.text,
                          );
                        } else {
                          // ubah data
                          item?.name = nameController.text;
                          item?.price = int.parse(priceController.text);
                          item?.stok = int.parse(stokController.text);
                          item?.kode = kodeBarangController.text;
                        }
                        // kembali ke layar sebelumnya dengan membawa objek item
                        Navigator.pop(context, item);
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  // tombol batal
                  Expanded(
                    child: ElevatedButton(
                      //color: Theme.of(context).primaryColorDark,
                      //textColor: Theme.of(context).primaryColorLight,
                      child: const Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

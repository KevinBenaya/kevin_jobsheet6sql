import 'dart:html';

import 'package:flutter/material.dart';

import 'item.dart';

class EntryForm extends StatefulWidget {
  final Item item;

  EntryForm(this.item);

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  Item item;

  _EntryFormState(this.item);
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

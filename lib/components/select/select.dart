import 'package:flutter/material.dart';

// Esta componente aceita como entrada:
//  - selectValue: é o value passado pelo valueNotifier
//  - options: é um array de opções
//  - valueNotifier: é um valueNotifier

class Select extends StatefulWidget {

  final options;
  var selectValue;
  final ValueNotifier valueNotifier;
  Select({Key? key, required this.selectValue, required this.options, required this.valueNotifier}) : super(key: key);

  @override
  State<Select> createState() => _Select();
}

class _Select extends State<Select> {


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.selectValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        widget.valueNotifier.value = newValue;
      },
      items: widget.options
          .map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value["name"],
          child: Text(value["name"]),
        );
      }).toList(),
    );
  }
}
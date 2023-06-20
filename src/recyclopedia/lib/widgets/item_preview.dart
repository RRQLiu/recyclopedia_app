import 'package:flutter/material.dart';


/// Displays a preview of an item, used in item_modal.

class ItemPreview extends Container {
  final Map item;
  // final bool hasLabel;

  ItemPreview(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0XFF4B905F),
              offset: Offset(4, 4),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            )
          ],
          border: Border.all(color: const Color(0XFF4B905F), width: 3)),
      child: Column(
        children: [
          Container(
            child: Image.network(
              item["image"],
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          // if(hasLabel)
          // Text(
          //   item["name"],
          //   style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          // )
        ],
      ),
    );
  }
}

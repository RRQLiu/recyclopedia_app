import 'package:flutter/material.dart';
import 'package:recyclopedia/utils/navigate_to_item_modal.dart';

/// The ClickableTrashItem widget holds the style of the items in the homescreen.
class ClickableTrashItem extends StatelessWidget {
  final Map item;

  const ClickableTrashItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        navigateToItemModal(context, item);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
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
            Expanded(
                child: Image.network(
              item["image"],
              height: 200,
              fit: BoxFit.contain,
            ),),
            Text(
              item["name"],
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

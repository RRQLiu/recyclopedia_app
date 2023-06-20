// Define a function that navigates to a new page
import 'package:flutter/material.dart';
import '../screens/item_modal.dart';

/// This method will navigate the page to ItemModal when an item is clicked in `Home` page.
void navigateToItemModal(BuildContext context, Map item) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>
            ItemModal(item["name"], item["image"], item["description"])),
  );
}

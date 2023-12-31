import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'recycle_resource_place.dart';
import 'recycle_map_component.dart';

class PlaceList extends StatefulWidget {
  const PlaceList({super.key});

  @override
  State<PlaceList> createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<MapState>(context);
    return Column(
      children: [
        _ListCategoryButtonBar(
          selectedCategory: state.selectedCategory,
          onCategoryChanged: (value) => _onCategoryChanged(value),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
            controller: _scrollController,
            shrinkWrap: true,
            children: state.places
                .where((place) => place.category == state.selectedCategory)
                .map((place) => _PlaceListTile(place: place))
                .toList(),
          ),
        ),
      ],
    );
  }

  void _onCategoryChanged(PlaceCategory newCategory) {
    _scrollController.jumpTo(0.0);
    Provider.of<MapState>(context, listen: false)
        .setSelectedCategory(newCategory);
  }
}

class _CategoryButton extends StatelessWidget {
  final PlaceCategory category;

  final bool selected;
  final ValueChanged<PlaceCategory> onCategoryChanged;

  const _CategoryButton({
    required this.category,
    required this.selected,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    late String buttonText;
    switch (category) {
      case PlaceCategory.binAvailable:
        buttonText = 'Available';
        break;
      case PlaceCategory.binUnavailable:
        buttonText = 'Unavailable';
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: selected ? Colors.blue : Colors.transparent,
          ),
        ),
      ),
      child: ButtonTheme(
        height: 50.0,
        child: TextButton(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: selected ? 20.0 : 18.0,
              color: selected ? Colors.blue : Colors.black87,
            ),
          ),
          onPressed: () => onCategoryChanged(category),
        ),
      ),
    );
  }
}

class _ListCategoryButtonBar extends StatelessWidget {
  final PlaceCategory selectedCategory;

  final ValueChanged<PlaceCategory> onCategoryChanged;

  const _ListCategoryButtonBar({
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _CategoryButton(
          category: PlaceCategory.binAvailable,
          selected: selectedCategory == PlaceCategory.binAvailable,
          onCategoryChanged: onCategoryChanged,
        ),
        _CategoryButton(
          category: PlaceCategory.binUnavailable,
          selected: selectedCategory == PlaceCategory.binUnavailable,
          onCategoryChanged: onCategoryChanged,
        ),
      ],
    );
  }
}

class _PlaceListTile extends StatelessWidget {
  final RecycleResourcePlace place;

  const _PlaceListTile({
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/place/${place.id}'),
      child: Container(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place.name,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              maxLines: 3,
            ),
            Text(
              place.description,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16.0),
            Divider(
              height: 2.0,
              color: Colors.grey[700],
            ),
          ],
        ),
      ),
    );
  }
}
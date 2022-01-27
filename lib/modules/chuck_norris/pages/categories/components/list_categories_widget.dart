import 'package:flutter/material.dart';

import '../../../models/chuck_category_model.dart';
import '../../joke/joke_page.dart';

class ListCategoriesWidget extends StatelessWidget {
  final List<ChuckCategoryModel> categories;
  const ListCategoriesWidget({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        return ListTile(
          onTap: () => Navigator.of(context).pushNamed(
            '/joke',
            arguments: category.title,
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          title: Text(category.title),
        );
      },
    );
  }
}

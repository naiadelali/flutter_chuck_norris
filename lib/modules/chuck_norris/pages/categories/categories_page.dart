import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_app_bar_widget.dart';
import '../../models/chuck_category_model.dart';
import 'categories_controller.dart';
import 'components/list_categories_widget.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _controller = ChuckNorrisController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Chuck Norris Jokes',
      ),
      body: FutureBuilder<List<ChuckCategoryModel>>(
          future: _controller.getJokesCategories(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.none:
                return Text('Não retornou nada');
              default:
                if (snapshot.hasData) {
                  return ListCategoriesWidget(categories: snapshot.data ?? []);
                } else {
                  if (snapshot.error is Exception) {
                    return Text(snapshot.error.toString());
                  } else {
                    return Text('Outra coisa');
                  }
                }
            }
          }),
    );
  }
}

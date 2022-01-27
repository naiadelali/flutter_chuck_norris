import 'package:flutter_chuck_norris/common/errors.dart';

import '../../../../common/widgets/custom_gradient_widget.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_app_bar_widget.dart';
import '../../models/chuck_joke_model.dart';
import 'joke_controller.dart';
import 'components/joke_body_widget.dart';

class JokePage extends StatefulWidget {
  final String category;
  const JokePage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  final _controller = JokeController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Joke - ${widget.category}',
      ),
      body: FutureBuilder<ChuckJokeModel>(
          future:
              _controller.getRandomJokeFromCategory(category: widget.category),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.none:
                return Text('Sem dados');
              default:
                if (snapshot.hasData) {
                  return Stack(
                    children: <Widget>[
                      CustomGradientWidget(),
                      JokeBodyWidget(displayJoke: snapshot.data),
                    ],
                  );
                }
                if (snapshot.hasError) {
                  if (snapshot.error is HttpClientError) {
                    var error = snapshot.error as HttpClientError;
                    return Text(error.message ?? 'OOps! aconteceu algo');
                  }
                  if (snapshot.error is RepositoryFailure) {
                    var error = snapshot.error as RepositoryFailure;
                    return Text(error.message ?? '');
                  }
                  return Text(snapshot.error.toString());
                } else {
                  return Text('OOu! sem dados');
                }
            }
          }),
    );
  }
}

import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.blueGrey),),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState> (
      builder: (_, state){
        if( state is RemoteArticlesLoading){
          return const Center(child: CupertinoActivityIndicator());
        }
        if( state is RemoteArticlesError){
          return const Center(child: Icon(Icons.refresh));
        }
        if( state is RemoteArticlesDone){
          return ListView.builder(
              itemBuilder: (context, index){
                return ArticleWidget(
                  article: state.articles![index],
                );
              },
            itemCount: state.articles!.length,
          );
        }
        return SizedBox();
      },
    );
  }
}

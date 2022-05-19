import 'package:flutter/material.dart';
import 'package:news_app_testing/data/remote/model/article/article_model.dart';
import 'package:collection/collection.dart';

class ArticlesItem extends StatelessWidget {
  final ArticleModel _articleModel;

  ArticlesItem(this._articleModel);

  Widget imageArticles() {
    var media = _articleModel.media;
    var url = media.firstOrNull?.mediaMetaData.firstOrNull?.url;
    return Image.network(
      url ??
          'https://images.unsplash.com/photo-1587132137056-bfbf0166836e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmFuYW5hfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: imageArticles(),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                _articleModel.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
            subtitle: Text(
              _articleModel.summary,
              style: const TextStyle(
                fontSize: 12,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
            trailing: const SizedBox(
              child: Icon(Icons.chevron_right),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              _articleModel.publishedDate,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}

import 'package:floor/floor.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );
  factory ArticleModel.fromJson(Map<String, dynamic> element) {
    return ArticleModel(
      author: element['author'] ?? "",
      title: element['title'] ?? "",
      description: element['description'] ?? "",
      url: element['url'] ?? "",
      urlToImage: element["urlToImage"] ??
          "https://static.vecteezy.com/system/resources/previews/005/337/799/large_2x/icon-image-not-found-free-vector.jpg",
      publishedAt: element['publishedAt'] ?? "",
      content: element['content'] ?? "",
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
        id: entity.id,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content);
  }
}

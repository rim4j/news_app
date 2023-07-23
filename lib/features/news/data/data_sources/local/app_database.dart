import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:news_app/features/news/data/data_sources/local/article_dao.dart';
import 'package:news_app/features/news/data/models/article_model.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDataBase extends FloorDatabase {
  ArticleDao get articleDAO;
}

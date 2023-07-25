import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/common/constants/dimens.dart';
import 'package:news_app/config/theme/app_colors.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';
import 'package:news_app/features/news/presentation/bloc/bookmark_status/find_bookmark_article_status.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';

class SingleNewsPage extends HookWidget {
  const SingleNewsPage({
    super.key,
    required this.article,
  });
  final ArticleEntity article;
  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        BlocProvider.of<NewsBloc>(context)
            .add(FindBookmarkArticleEvent(title: article.title!));
        return null;
      },
      [],
    );

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, newsState) {
          if (newsState.findBookmarkArticleStatus
              is FindBookmarkArticleStatusCompleted) {
            final FindBookmarkArticleStatusCompleted
                findBookmarkArticleStatusCompleted =
                newsState.findBookmarkArticleStatus
                    as FindBookmarkArticleStatusCompleted;
            final bool isExist = findBookmarkArticleStatusCompleted.isExist;
            return FloatingActionButton(
              onPressed: () {
                if (isExist) {
                  BlocProvider.of<NewsBloc>(context)
                      .add(DeleteBookmarkArticleEvent(title: article.title!));
                  BlocProvider.of<NewsBloc>(context)
                      .add(FindBookmarkArticleEvent(title: article.title!));
                } else {
                  BlocProvider.of<NewsBloc>(context)
                      .add(AddToBookmarkEvent(articleEntity: article));
                  BlocProvider.of<NewsBloc>(context)
                      .add(FindBookmarkArticleEvent(title: article.title!));
                }
              },
              child: Icon(
                isExist ? Icons.bookmark : Icons.bookmark_outline,
                color: AppColors.white,
              ),
            );
          }
          return const SizedBox();
        },
      ),
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          article.title!,
          style: fEncodeSansMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height / 3,
              child: CachedNetworkImage(
                imageUrl: article.urlToImage!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: ((context, url) =>
                    const CircularProgressIndicator()),
                errorWidget: ((context, url, error) {
                  return Icon(
                    Icons.image_not_supported_outlined,
                    size: Dimens.xLarge - 14,
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimens.small),
              child: Column(
                children: [
                  SizedBox(height: Dimens.medium),
                  Text(article.title!, style: fEncodeSansBold),
                  SizedBox(height: Dimens.medium),
                  Text(
                    article.description!,
                    style: fEncodeSansMedium.copyWith(height: 1.5),
                  ),
                  SizedBox(height: Dimens.medium),
                  Text(
                    article.content!,
                    style: fEncodeSansMedium.copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

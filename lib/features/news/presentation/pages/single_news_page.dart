import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/constants/dimens.dart';
import 'package:news_app/config/theme/app_colors.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';

class SingleNewsPage extends StatelessWidget {
  const SingleNewsPage({
    super.key,
    required this.article,
  });
  final ArticleEntity article;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.bookmark,
          color: AppColors.white,
        ),
      ),
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
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

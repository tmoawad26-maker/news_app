import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_strings.dart';

class CategoryModel {
  final String id;

  final String imagePath;

  final String title;

  CategoryModel({
    required this.id,
    required this.imagePath,
    required this.title,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'general',
      imagePath: Assets.imagesGeneral,
      title: AppStrings.general,
    ),
    CategoryModel(
      id: 'business',
      imagePath: Assets.imagesBusiness,
      title: AppStrings.business,
    ),
    CategoryModel(
      id: 'sports',
      imagePath: Assets.imagesSports,
      title: AppStrings.sports,
    ),
    CategoryModel(
      id: 'science',
      imagePath: Assets.imagesScience,
      title: AppStrings.science,
    ),
    CategoryModel(
      id: 'entertainment',
      imagePath: Assets.imagesEntertainment,
      title: AppStrings.entertainment,
    ),
    CategoryModel(
      id: 'technology',
      imagePath: Assets.imagesTechnology,
      title: AppStrings.technology,
    ),
  ];
}

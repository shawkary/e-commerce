import 'package:dartz/dartz.dart';
import 'package:ibrahim_project/features/home/data/model/add_remove_favorite/AddFavoriteModel.dart';
import 'package:ibrahim_project/features/home/data/model/category_model/CategoryModel.dart';
import 'package:ibrahim_project/features/home/data/model/product_model/HomeModel.dart';
import 'package:ibrahim_project/features/login/data/model/LoginModel.dart';
import '../../../../core/errors/failures.dart';
import '../model/favorite_model/FavoriteList.dart';


abstract class HomeRepo
{
  Future<Either<Failure, HomeModel>> fetchProductData();
  Future<Either<Failure, CategoryModel>> fetchCategoryData();
  Future<Either<Failure, List<FavoriteList>>> fetchFavoriteData();
  Future<Either<Failure, LoginModel>> fetchProfileData();
  Future<Either<Failure, LoginModel>> updateProfileData(name, email, phone);
  Future<Either<Failure, AddFavoriteModel>> addOrRemoveFavorites({required num productId});
}
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ibrahim_project/core/errors/failures.dart';
import 'package:ibrahim_project/core/utiles/dio_helper.dart';
import 'package:ibrahim_project/features/home/data/model/add_remove_favorite/AddFavoriteModel.dart';
import 'package:ibrahim_project/features/home/data/model/category_model/CategoryModel.dart';
import 'package:ibrahim_project/features/home/data/model/favorite_model/FavoriteList.dart';
import 'package:ibrahim_project/features/home/data/model/logout_model/LogoutModel.dart';
import 'package:ibrahim_project/features/home/data/repos/home_repo.dart';
import 'package:ibrahim_project/features/login/data/model/LoginModel.dart';
import '../../../../constants.dart';
import '../model/product_model/HomeModel.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.dio);

  DioHelper dio;

  @override
  Future<Either<Failure, HomeModel>> fetchProductData() async {
    try {
      var data = await dio.getData(
        endPoint: 'home',
        token: token,
      );
      HomeModel homeModel;
      homeModel = HomeModel.fromJson(data);
      return right(homeModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CategoryModel>> fetchCategoryData() async {
    try {
      var data = await dio.getData(endPoint: 'categories');
      CategoryModel categoryModel;
      categoryModel = CategoryModel.fromJson(data);
      return right(categoryModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<FavoriteList>>> fetchFavoriteData() async {
    try {
      var data = await dio.getData(
        endPoint: 'favorites',
        token: token,
      );
      List<FavoriteList> favorite = [];
      for (var item in data['data']['data']) {
        favorite.add(FavoriteList.fromJson(item));
      }
      return right(favorite);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LoginModel>> fetchProfileData() async {
    try {
      var data = await dio.getData(
        endPoint: 'profile',
        token: token,
      );
      LoginModel loginModel;
      loginModel = LoginModel.fromJson(data);
      return right(loginModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AddFavoriteModel>> addOrRemoveFavorites({
    required num productId,
  }) async {
    try {
      var data = await dio.postData(
        endPoint: 'favorites?=',
        token: token,
        data: {
          'product_id': productId,
        },
      );
      AddFavoriteModel model;
      model = AddFavoriteModel.fromJson(data.data);
      return right(model);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LoginModel>> updateProfileData(
    name,
    email,
    phone,
  ) async {
    try {
      var result = await dio.putData(
        endPoint: 'update-profile',
        token: token,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
        },
      );
      LoginModel loginModel;
      loginModel = LoginModel.fromJson(result.data);
      return right(loginModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/data/model/add_remove_favorite/AddFavoriteModel.dart';
import 'package:ibrahim_project/features/home/data/model/category_model/CategoryModel.dart';
import 'package:ibrahim_project/features/home/data/model/product_model/HomeModel.dart';
import 'package:ibrahim_project/features/home/data/repos/home_repo.dart';
import 'package:ibrahim_project/features/home/presentation/manager/shop_cubit/states.dart';
import '../../../../login/data/model/LoginModel.dart';
import '../../../data/model/favorite_model/FavoriteList.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit(this.homeRepo) : super(InitialHomeState());
  final HomeRepo homeRepo;

  static ShopCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;
  String? errProduct;

  Future<void> fetchProductData() async {
    emit(LoadingProductState());
    var result = await homeRepo.fetchProductData();

    result.fold((failure) {
      errProduct = failure.errorMessage;
      emit(ErrorProductState());
    }, (homeModel) {
      this.homeModel = homeModel;
      emit(SuccessProductState());
    });
  }

  //////////////////////////////////////////////////////////////

  CategoryModel? categoryModel;
  String? errCategory;

  Future<void> fetchCategoryData() async {
    emit(LoadingCategoryState());
    var result = await homeRepo.fetchCategoryData();

    result.fold((failure) {
      errCategory = failure.errorMessage;
      emit(ErrorCategoryState());
    }, (categoryModel) {
      this.categoryModel = categoryModel;
      emit(SuccessCategoryState());
    });
  }

  ///////////////////////////////////////////////////////////////

  List<FavoriteList>? favorite;
  String? errFavorite;

  Future<void> fetchFavoritesData() async {
    emit(LoadingFavoriteState());
    var result = await homeRepo.fetchFavoriteData();

    result.fold((failure) {
      errFavorite = failure.errorMessage;
      emit(ErrorFavoriteState());
    }, (favorite) {
      this.favorite = favorite;
      emit(SuccessFavoriteState());
    });
  }

  //////////////////////////////////////////////////////////////

  LoginModel? loginModel;
  String? errProfile;

  Future<void> fetchProfileData() async {
    emit(LoadingProfileState());
    var result = await homeRepo.fetchProfileData();

    result.fold((failure) {
      errProfile = failure.errorMessage;
      emit(ErrorProfileState());
    }, (loginModel) {
      this.loginModel = loginModel;
      emit(SuccessProfileState());
    });
  }

  //////////////////////////////////////////////////////////////

  String? errUpdateProfile;

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    var result = await homeRepo.updateProfileData(name, email, phone);

    result.fold((failure) {
      errUpdateProfile = failure.errorMessage;
      emit(ErrorUpdateProfileState());
    }, (loginModel) {
      this.loginModel = loginModel;
      emit(SuccessUpdateProfileState());
    });
  }

  //////////////////////////////////////////////////////////////////////

  AddFavoriteModel? model;

  void addFavorite({
    required num productId,
  }) async {
    var result = await homeRepo.addOrRemoveFavorites(productId: productId);
    result.fold((l) {}, (r) {
      model = r;
      fetchProductData();
      fetchFavoritesData();
    });
  }
}

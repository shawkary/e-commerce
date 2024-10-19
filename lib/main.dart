import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utiles/cache_helper.dart';
import 'package:ibrahim_project/features/home/presentation/views/home_view.dart';
import 'package:ibrahim_project/features/on_boarding/presentation/views/boarding_view.dart';
import 'constants.dart';
import 'core/utiles/components.dart';
import 'core/utiles/dio_helper.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/manager/shop_cubit/cubit.dart';
import 'features/login/presentation/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  isLast = CacheHelper.getData(key: 'isLast');
  token = CacheHelper.getData(key: 'token');
  Widget widget;
  if (isLast != null) {
    if (token != null) {
      widget = const HomeView();
    } else {
      widget = const LoginView();
    }
  } else {
    widget = const OnBoardingView();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  const MyApp(this.widget, {super.key});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ShopCubit(HomeRepoImpl(DioHelper(Dio())))
              ..fetchProductData()
              ..fetchCategoryData()
              ..fetchFavoritesData()
              ..fetchProfileData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget,
      ),
    );
  }
}

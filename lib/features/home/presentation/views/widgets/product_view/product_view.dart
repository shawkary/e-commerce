import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';
import '../../../../../../core/errors/custom_error_widget.dart';
import '../../../manager/shop_cubit/cubit.dart';
import '../../../manager/shop_cubit/states.dart';
import 'carousal_slider.dart';
import 'category_list_view.dart';
import 'custom_grid_view.dart';


class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (BuildContext context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        if (cubit.homeModel != null) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCarousalSlider(cubit.homeModel!.data!.banners!),
                      const SizedBox(height: 15),
                      const Text('  Categories', style: Styles.textStyle20),
                      const CategoryListView(),
                      const SizedBox(height: 20),
                      const Text('  Products', style: Styles.textStyle20),
                    ]
                ),
              ),
               SliverToBoxAdapter(
                child: CustomGridView(cubit),
              ),
            ],
          );
        }else if(cubit.errProduct != null){
          return Center(child: CustomErrorWidget(errMessage: cubit.errProduct!));
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

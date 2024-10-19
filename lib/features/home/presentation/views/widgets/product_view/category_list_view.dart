import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager/shop_cubit/cubit.dart';
import '../../../manager/shop_cubit/states.dart';



class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (BuildContext context, state) {
        ShopCubit cubit = ShopCubit.get(context);
          return SizedBox(
            height: 100,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: .5)
                      ),
                      child: CachedNetworkImage(
                        width: 120,
                        fit: BoxFit.fill,
                        imageUrl: cubit.categoryModel!.data!.categoryData![index].image!,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                      ),
                    ));
              },
              itemCount: cubit.categoryModel!.data!.categoryData!.length,
              scrollDirection: Axis.horizontal,
            ),
          );
      },
    );
  }
}

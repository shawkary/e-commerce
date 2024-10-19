import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';
import '../../../../../../core/errors/custom_error_widget.dart';
import '../../../manager/shop_cubit/cubit.dart';
import '../../../manager/shop_cubit/states.dart';



class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (BuildContext context, state) {
        ShopCubit cubit = ShopCubit.get(context);
          if (cubit.categoryModel != null) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: .2, color: Colors.red)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cubit.categoryModel!.data!.categoryData![index].name!,
                                  style: Styles.textStyle20.copyWith(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blue)),
                              CachedNetworkImage(
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                                imageUrl:
                                cubit.categoryModel!.data!.categoryData![index].image!
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_right,
                              size: 40,
                              color: Colors.blue,
                            ))
                      ],
                    ),
                  ),
                );
              },
              itemCount: cubit.categoryModel!.data!.categoryData!.length,
            );
          }else if(cubit.errCategory != null){
            return Center(child: CustomErrorWidget(errMessage: cubit.errCategory!));
          }else{
            return const Center(child: CircularProgressIndicator());
          }
      },
    );
  }
}

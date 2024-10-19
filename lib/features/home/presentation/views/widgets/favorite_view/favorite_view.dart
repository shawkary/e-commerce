import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';
import '../../../../../../core/errors/custom_error_widget.dart';
import '../../../manager/shop_cubit/cubit.dart';
import '../../../manager/shop_cubit/states.dart';


class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (BuildContext context, state) {
        ShopCubit cubit = ShopCubit.get(context);
            if (cubit.favorite != null) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 7, left: 7),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(width: .2)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                              fit: BoxFit.fill,
                              width: 180,
                              imageUrl: cubit.favorite![index].product!.image!,
                            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cubit.favorite![index].product!.name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.textStyle20,),
                                Text(
                                    cubit.favorite![index].product!.description!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.textStyle16.copyWith(color: Colors.grey)),
                                // const SizedBox(height: 100),
                                const Spacer(),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            '${cubit.favorite![index].product!.price!}',
                                            style: Styles.textStyle16.copyWith(color: Colors.red)),
                                        const SizedBox(width: 5),
                                        Text(
                                            '${cubit.favorite![index].product!.oldPrice!}',
                                            style: Styles.textStyle16.copyWith(
                                            color: Colors.grey, decoration: TextDecoration.lineThrough)),
                                      ],
                                    ),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: ()
                                        {
                                          cubit.addFavorite(productId: cubit.favorite![index].product!.id!);
                                        },
                                        icon: const Icon(Icons.delete, size: 20, color: Colors.red))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: cubit.favorite!.length,
              );
            }else if(cubit.errFavorite != null){
              return Center(child: CustomErrorWidget(errMessage: cubit.errFavorite!));
            }else{
              return const Center(child: CircularProgressIndicator());
            }
      },
    );
  }
}




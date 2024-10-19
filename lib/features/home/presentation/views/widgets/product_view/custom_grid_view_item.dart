import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';
import '../../../manager/shop_cubit/cubit.dart';


class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem(this.cubit, this.index, {super.key});

  final ShopCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    var pro = cubit.homeModel!.data!.products![index];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: .1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              CachedNetworkImage(
                imageUrl: pro.image!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
              if (pro.discount != 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.red,
                  child: Text(
                    'discount: ${pro.discount!}',
                    style: const TextStyle(fontSize: 8, color: Colors.white),
                  ),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pro.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16,
                ),
                Text(
                  pro.description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14.copyWith(color: Colors.grey[600]),
                ),
                Row(
                  children: [
                    Text(
                      '${pro.price}',
                      style: Styles.textStyle14.copyWith(color: Colors.red),
                    ),
                    const SizedBox(width: 5),
                    if (pro.discount != 0)
                      Text(
                        '${pro.oldPrice}',
                        style: Styles.textStyle14.copyWith(
                            color: Colors.grey[700],
                            decoration: TextDecoration.lineThrough),
                      ),
                    const Spacer(),
                      IconButton(
                        onPressed: () {
                          cubit.addFavorite(productId: pro.id!);
                          Future.delayed(const Duration(seconds: 7), () {
                          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(
                            cubit.model!.message!
                          )));
                          },);
                        },
                        icon: Icon(pro.inFavorites! ? Icons.favorite : Icons.favorite_border,
                          size: 12,
                          color: pro.inFavorites! ? Colors.red : Colors.black,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

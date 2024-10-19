import 'package:flutter/material.dart';
import '../../../manager/shop_cubit/cubit.dart';
import 'custom_grid_view_item.dart';


class CustomGridView extends StatelessWidget {
  const CustomGridView(this.cubit, {super.key});
  final ShopCubit cubit;

  @override
  Widget build(BuildContext context) {
        return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              mainAxisExtent: 340,
            ),
            itemBuilder: (context, index) {
              return CustomGridViewItem(cubit, index);
            },
            itemCount: cubit.homeModel!.data!.products!.length,
          );
  }
}

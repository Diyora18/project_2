import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/data/models/product_model.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';
import 'package:project_2/feature/common/reusable_bottom_navigation.dart';

import '../../home/widgets/product_item.dart';
import '../managers/saved_cubit.dart';
import '../managers/saved_state.dart';
import '../widgets/unsave_widget.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SavedCubit(savedProductRepo: context.read()),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.white,
        appBar: ReusableAppBar(title: "Saved Products"),
        body: BlocBuilder<SavedCubit, SavedState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.errorMessage != null) {
              return Center(child: Text("Xato: ${state.errorMessage}"));
            }
            if (state.savedProduct.isEmpty) {
              return const Center(child: NoSavedWidgets());
            }
            return GridView.builder(
              padding: EdgeInsets.only(left: 24, right: 24, top: 30),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 19,
                mainAxisSpacing: 20,
                childAspectRatio: 161 / 174,
              ),
              itemCount: state.savedProduct.length,
              itemBuilder: (context, index) {
                final ProductModel product = state.savedProduct[index];
                return ProductItem(
                  width: 161,
                  height: 174,
                  imageHeight: 122,
                  image: product.image ,
                  title: product.title,
                  price: product.price,
                  id: product.id,
                  isLiked: true,
                  onUnSave: (){
                    context.read<SavedCubit>().removeFromSaved(product.id);
                  },
                );
              },
            );
          },
        ),
        bottomNavigationBar: ReusableBottomNavigation(isActive: 2),
      ),
    );
  }
}

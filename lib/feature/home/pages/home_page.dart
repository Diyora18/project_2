import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/feature/common/reusable_bottom_navigation.dart';
import 'package:project_2/feature/home/widgets/row_textform_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../data/models/category_model.dart';
import '../managers/category_cubit.dart';
import '../managers/category_state.dart';
import '../managers/product_bloc.dart';
import '../managers/product_event.dart';
import '../managers/product_state.dart';
import '../widgets/category_item.dart';
import '../widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Discover",
          style: TextStyle(
            color: AppColors.black,
            fontFamily: "GeneralSans",
            fontSize: 32.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: () {
                context.push("/notification-page");
              },
              child: SvgPicture.asset('assets/Bell.svg'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.push('/search-page');
              },
              child: AbsorbPointer(child: RowTextFormWidget()),
            ),
            SizedBox(height: 20.h,),
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, categoryState) {
                if (categoryState.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (categoryState.errorMessage != null) {
                  return Center(
                    child: Text("Xato: ${categoryState.errorMessage}"),
                  );
                }
                if (categoryState.categories.isEmpty) {
                  return const Center(child: Text("Kategoriya yo‘q"));
                }

                final allCategory = CategoryModel(id: 0, title: "All");
                final categories = [allCategory, ...categoryState.categories];

                return SizedBox(
                  height: 36.h,
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, productState) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          final isSelected =
                              productState.categoryId == category.id;

                          return CategoryItem(
                            titleColor: isSelected
                                ? AppColors.white
                                : AppColors.black,
                            backgroundColor: isSelected
                                ? AppColors.black
                                : AppColors.white,
                            category: category,
                            isSelected: isSelected,
                            onTap: () {
                              if (category.id == 0) {
                                context.read<ProductBloc>().add(
                                  FetchAllProducts()
                                );
                              } else {
                                context.read<ProductBloc>().add(
                                  FetchByCategory(category.id),
                                );
                              }
                            },
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, productState) {
                  if (productState.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (productState.errorMessage != null) {
                    return Center(
                      child: Text("Xato: ${productState.errorMessage}"),
                    );
                  }
                  if (productState.products.isEmpty) {
                    return const Center(child: Text("Product yo‘q"));
                  }

                  return GridView.builder(
                    itemCount: productState.products.length,
                    itemBuilder: (context, index) {
                      final product = productState.products[index];
                      return ProductItem(
                        id: product.id,
                        isLiked: product.isLiked,
                        image: product.image,
                        title: product.title,
                        price: product.price,
                        discount: product.discount,
                        onLikeTap: () {
                          if (product.isLiked) {
                            context.read<ProductBloc>().add(
                              UnsaveProduct(product.id),
                            );
                          } else {
                            context.read<ProductBloc>().add(
                              SaveProduct(product.id),
                            );
                          }
                        },
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 161 / 224,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ReusableBottomNavigation(isActive: 0),
    );
  }
}

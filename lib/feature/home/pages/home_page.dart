import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/data/models/home/category_model.dart';
import 'package:project_2/data/repositories/home/category_repository.dart';
import 'package:project_2/data/repositories/home/product_repository.dart';
import 'package:project_2/feature/common/reusable_bottom_navigation.dart';
import 'package:project_2/feature/home/managers/category_cubit.dart';
import 'package:project_2/feature/home/managers/category_state.dart';
import 'package:project_2/feature/home/managers/product_cubit.dart';

import '../managers/product_state.dart';
import '../widgets/category_item.dart';
import '../widgets/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(
            categoryRepo: context.read<CategoryRepository>(),
          )..fetchCategories(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(
            productRepository: context.read<ProductRepository>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Discover",
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 32,
              fontFamily: "GeneralSans",
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: GestureDetector(
                onTap: (){
                  context.go("/notification-page");
                },
                  child: SvgPicture.asset("assets/Bell.svg")),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 281.w,
                    height: 52.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search for clothes...",
                        hintStyle: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        prefixIcon: SvgPicture.asset(
                          "assets/Search.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.hintColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    width: 52.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.black,
                    ),
                    child: SvgPicture.asset(
                      "assets/Filter.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state.errorMessage != null) {
                    return Center(child: Text("Xato: ${state.errorMessage}"));
                  }
                  if (state.categories.isEmpty) {
                    return Center(child: Text("Kategoriya yo'q"));
                  }

                  final allCategory = CategoryModel(id: 0, title: "All");
                  final categories = [allCategory, ...state.categories];

                  return SizedBox(
                    height: 36.h,
                    child: BlocBuilder<ProductCubit, ProductState>(
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
                                  context
                                      .read<ProductCubit>()
                                      .fetchAllProducts();
                                } else {
                                  context.read<ProductCubit>().fetchProducts(
                                    category.id,
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

              const SizedBox(height: 12),

              Expanded(
                child: BlocBuilder<ProductCubit, ProductState>(
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
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 162 / 225,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ReusableBottomNavigation(isActive: 0),
      ),
    );
  }
}

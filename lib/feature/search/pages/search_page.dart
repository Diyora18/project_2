import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';
import 'package:project_2/feature/common/reusable_bottom_navigation.dart';
import '../../../core/utils/app_colors.dart';
import '../../common/empty_widget.dart';
import '../../home/managers/product_bloc.dart';
import '../../home/managers/product_event.dart';
import '../../home/managers/product_state.dart';
import '../../home/widgets/row_textform_widget.dart';
import '../widgets/recent_searches_widget.dart';
import '../widgets/search_item_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  late Box<String> _recentBox;

  @override
  void initState() {
    super.initState();
    _recentBox = Hive.box<String>('recent_search');
  }

  void _saveToRecent(String query) {
    if (query.trim().isEmpty) return;

    final existingKey = _recentBox.keys.firstWhere(
          (key) => _recentBox.get(key) == query,
      orElse: () => "",
    );

    if (existingKey != '') {
      _recentBox.delete(existingKey);
    }

    _recentBox.add(query);
  }

  void _deleteRecent(dynamic key) {
    _recentBox.delete(key);
  }

  void _clearAllRecent() {
    _recentBox.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: ReusableAppBar(title: 'Search'),
        body: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              RowTextFormWidget(
              showFilter: false,
              controller: controller,
              onChanged: (query) {
                context.read<ProductBloc>().add(SearchProducts(query));
              },
              onSubmitted: (query) {
                _saveToRecent(query);
              },
            ),
            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Searches",
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: "GeneralSans",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: _clearAllRecent,
                  child: Text(
                    "Clear all",

                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.black,
                      decorationStyle: TextDecorationStyle.solid,
                      color: AppColors.black,
                      fontFamily: 'GeneralSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (controller.text.isNotEmpty) {
                        if (state.products.isEmpty) {
                          return Center(
                            child: EmptyStateWidget(
                              assetPath: 'assets/Search-duotone.svg',
                              title: 'No Results Found!',
                              subtitle:
                              'Try a similar word or something more general.',
                            ),
                          );
                        }

                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 20,
                            childAspectRatio: 4,
                            crossAxisCount: 1,
                          ),

                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final product = state.products[index];

                            return SearchItemWidget(
                              onTap: () {
                                WidgetsBinding.instance.addPostFrameCallback((_) {

                                });
                              },


                              product: product,
                            );
                          },
                        );
                      } else {
                        return ValueListenableBuilder(
                          valueListenable: _recentBox.listenable(),
                          builder: (context, Box<String> box, _) {
                            if (box.isEmpty) {
                              return const Center(
                                child: Text("No recent searches"),
                              );
                            }

                            return ListView.builder(
                              itemCount: box.length,
                              itemBuilder: (context, index) {
                                final key = box.keyAt(index);
                                final value = box.get(key);

                                return GestureDetector(
                                  onTap: () {
                                    controller.text = value ?? "";
                                    context.read<ProductBloc>().add(
                                      SearchProducts(value ?? "") ,
                                    );
                                  },
                                  child: RecentSearchesWidget(
                                    title: value ?? "",
                                    onPressed: () => _deleteRecent(key),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                ),
            ),
              ],
            ),
        ),
      bottomNavigationBar: ReusableBottomNavigation(isActive: 1),
    );
  }
}


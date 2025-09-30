import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_2/data/repositories/cart_repository.dart';
import 'package:project_2/data/repositories/category_repository.dart';
import 'package:project_2/data/repositories/detail_repository.dart';
import 'package:project_2/data/repositories/notification_repository.dart';
import 'package:project_2/data/repositories/product_repository.dart';
import 'package:project_2/data/repositories/review_repository.dart';
import 'package:project_2/feature/home/managers/category_cubit.dart';
import 'package:project_2/feature/home/managers/product_bloc.dart';
import 'package:project_2/feature/home/managers/product_event.dart';
import 'package:provider/provider.dart';
import 'core/client/client.dart';
import 'core/interceptor/interceptor.dart';
import 'core/routing/router.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/password_repository.dart';
import 'feature/authentication/managers/forgot_password_viewmodel.dart';
import 'feature/cart/managers/cart_bloc.dart';
import 'feature/cart/managers/cart_event.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('recent_search');
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            Provider<FlutterSecureStorage>(
              create: (_) => const FlutterSecureStorage(),
            ),
            Provider<AuthInterceptor>(
              create: (context) => AuthInterceptor(
                secureStorage: context.read<FlutterSecureStorage>(),
              ),
            ),

            Provider<ApiClient>(
              create: (context) =>
                  ApiClient(interceptor: context.read<AuthInterceptor>()),
            ),

            Provider<AuthRepository>(
              create: (context) => AuthRepository(
                apiClient: context.read<ApiClient>(),
              ),
            ),

            Provider<PasswordRepository>(
              create: (context) => PasswordRepository(
                apiClient: context.read<ApiClient>(),
              ),
            ),
            Provider(
              create: (context) => ProductRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) =>
                  CategoryRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) =>
                  NotificationRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) => DetailRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) => ReviewRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) => CartRepository(apiClient: context.read()),
            ),

            ChangeNotifierProvider<AuthViewModel>(
              create: (context) => AuthViewModel(
                resetRepo: context.read<PasswordRepository>(),
              ),
            ),

          ],
          child: Builder(
            builder: (context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) =>
                        ProductBloc(productRepo: context.read())
                          ..add(FetchAllProducts()),
                  ),
                  BlocProvider(
                    create: (context) =>
                        CategoryCubit(categoryRepo: context.read())
                          ..fetchCategories(),
                  ),
                  BlocProvider(
                    create: (context) => CartBloc(
                      repository: context.read<CartRepository>(),
                    )..add(LoadingCart()),
                  ),

                ],
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerConfig: router,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

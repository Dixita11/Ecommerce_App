import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/navigation/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'presentation/providers/product_provider.dart';
import 'presentation/providers/cart_provider.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/product_list_screen.dart';
import 'presentation/screens/product_detail_screen.dart';
import 'presentation/screens/checkout_screen.dart';
import 'data/models/product_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider()..loadProducts(),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const TrendifyApp(),
    ),
  );
}

class TrendifyApp extends StatelessWidget {
  const TrendifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trendify',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.splash) {
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
        if (settings.name == AppRoutes.productList) {
          return MaterialPageRoute(builder: (_) => const ProductListScreen());
        }
        if (settings.name == AppRoutes.productDetail) {
          final product = settings.arguments as ProductModel;
          return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          );
        }
        if (settings.name == AppRoutes.checkout) {
          return MaterialPageRoute(builder: (_) => const CheckoutScreen());
        }
        return null;
      },
    );
  }
}

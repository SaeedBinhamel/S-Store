import 'package:electronic_ptoject/Features/Cart/Presentation/Pages/cart_page.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Pages/products_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../Features/Products/Presentation/Pages/product_details_page.dart';

class AppRoutes {
  static final GoRouter appRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const ProductsPage()),
      GoRoute(
        path: '/cart',
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const CartPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;

                  const curve = Curves.easeInOut;

                  final tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
          );
        },
      ),
      GoRoute(
        path: '/products/:id',
        pageBuilder: (context, state) {
          // final id = int.parse(state.pathParameters['id']!);

          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: ProductDetailsPage(
              productId: int.parse(state.pathParameters['id']!),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;

                  const curve = Curves.easeInOut;

                  final tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
          );
        },
      ),
    ],
  );
}

CustomTransitionPage<void> buildSlidePage({
  required Widget child,
  required LocalKey key,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeInOut));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

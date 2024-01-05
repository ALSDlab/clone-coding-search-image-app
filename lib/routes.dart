import 'package:clone_coding_image_search_app/di/di_setup.dart';
import 'package:clone_coding_image_search_app/domain/model/image_model.dart';
import 'package:clone_coding_image_search_app/ui/detail/detail_screen.dart';
import 'package:clone_coding_image_search_app/ui/main/main_screen.dart';
import 'package:clone_coding_image_search_app/ui/main/main_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) =>
            ChangeNotifierProvider(create: (_) => getIt<MainViewmodel>(),
            child: const MainScreen(),)),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final imageItem = state.extra as ImageModel;
        return DetailScreen(
          imageModel: imageItem,
        );
      },
    ),
  ],
);

import 'package:apple_shop/bloc/category/category_state.dart';
import 'package:apple_shop/bloc/category/category_event.dart';
import 'package:apple_shop/bloc/category/category_bloc.dart';
import 'package:apple_shop/widgets/cached_image.dart';
import 'package:apple_shop/data/model/category.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(
      CategoryRequestList(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 44,
                  right: 44,
                  bottom: 32,
                  top: 20,
                ),
                child: Container(
                  height: 46,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        'assets/images/icon_apple_blue.png',
                      ),
                      const Expanded(
                        child: Text(
                          'دسته بندی',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 16,
                            color: CustomColors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: ((context, state) {
                if (state is CategoryLoadingState) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is CategoryResponseState) {
                  return state.response.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Text(l),
                        ),
                      );
                    },
                    (r) {
                      return _listCategory(
                        list: r,
                      );
                    },
                  );
                }
                return const SliverToBoxAdapter(
                  child: Text('Error'),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class _listCategory extends StatelessWidget {
  List<Category>? list;
  _listCategory({required this.list});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 44,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return CachedImage(
              imageUrl: list?[index].thumbnail,
              radius: 15,
            );
          },
          childCount: list?.length ?? 0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}

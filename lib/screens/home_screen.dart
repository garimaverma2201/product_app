import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:product_app/utils/Constants.dart';

import '../data/model/product_model.dart';
import '../logic/cubit/product_cubit.dart';
import '../logic/cubit/product_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appbarTitle),
      ),
      body: SafeArea(
        child:  BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {

            if(state is ProductErrorState) {
              SnackBar snackBar = SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

          },
          builder: (context, state) {

            if(state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is ProductLoadedState) {
              return buildProductListView(state.productsList.products!);
            }

            return const Center(
              child: Text("An error occured!"),
            );

          },
        ),
      ),
    );
  }

  Widget buildProductListView(List<Products> product) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) {
          Products products = product[index];

          return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Card(
                    child: ListTile(
                      leading: Image.network(products.thumbnail!,width: 60, height: 80,),
                      title: Text(products.title.toString()),
                      subtitle: Text(products.description.toString(), style:const TextStyle(fontSize: 13.0),),
                    ),
                  ),
                ),
              )
          );
        },
      ),
    );
  }

}

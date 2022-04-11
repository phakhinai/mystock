import 'package:flutter/material.dart';
import 'package:mystock/src/constants/api.dart';
import 'package:mystock/src/models/posts.dart';
import 'package:mystock/src/models/products.dart';
import 'package:mystock/src/services/network_service.dart';
import 'package:mystock/src/utils/format.dart';

class Stock extends StatelessWidget {
  const Stock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: NetworkService().getAllProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product>? product = snapshot.data;
          if (product == null || product.isEmpty) {
            return Container(
              margin: const EdgeInsets.only(top: 22),
              alignment: Alignment.topCenter,
              child: const Text('No data'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildProductGridView(product),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  GridView _buildProductGridView(List<Product> product) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.73,
      ),
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(8.0),
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 160,
                    child: Image.network(
                        '${API.IMAGE_URL}/${product[index].image}'),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    product[index].name.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        formatCurrency.format(product[index].price),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        formatNumber.format(product[index].stock),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      itemCount: product.length,
    );
  }
}

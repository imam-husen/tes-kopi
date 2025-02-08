import 'package:flutter/material.dart';
import 'package:kopi/widgets/models/coffe_model.dart';
import 'package:kopi/services/firestore_service.dart';
import 'package:kopi/widgets/coffe_item.dart';

class CoffeeList extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();

  CoffeeList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CoffeeModel>>(
      stream: firestoreService.getCoffees(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        var coffeeList = snapshot.data!;

        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4, 
          ),
          itemCount: coffeeList.length,
          itemBuilder: (context, index) {
            var coffee = coffeeList[index];
            return CoffeeItem(
              coffeeData: {
                'name': coffee.name,
                'imageURL': coffee.imageURL,
                'type': coffee.type,
                'price': coffee.price,
                'rating': coffee.rating,
              },
            );
          },
        );
      },
    );
  }
}

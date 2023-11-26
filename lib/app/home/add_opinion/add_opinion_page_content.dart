import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    super.key,
  });

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantsName = '';
  var pizzaName = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text('Restauracja'),
              ),
              onChanged: (value) {
                setState(() {
                  restaurantsName = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text('Pizza'),
              ),
              onChanged: (value) {
                setState(() {
                  pizzaName = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('restaurants').add(
                  {
                    'name': restaurantsName,
                    'pizza': pizzaName,
                    'rating': 7.0,
                  },
                );
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

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
  var rating = 5.0;

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
            Slider(
              value: rating,
              min: 0.0,
              max: 10.0,
              divisions: 20,
              label: rating.toString(),
              onChanged: (value) {
                setState(() {
                  rating = value;
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
                    'rating': rating,
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

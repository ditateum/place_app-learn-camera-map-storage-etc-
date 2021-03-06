import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: null,
      image: pickedImage,
    );

    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(
      'places',
      {
        "id": newPlace.id,
        "title": newPlace.title,
        "image": newPlace.image.path,
      },
    );
  }
}

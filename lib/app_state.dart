import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userAllergens =
          prefs.getStringList('ff_userAllergens') ?? _userAllergens;
    });
    _safeInit(() {
      _userIngredientDislikes =
          prefs.getStringList('ff_userIngredientDislikes') ??
              _userIngredientDislikes;
    });
    _safeInit(() {
      _userName = prefs.getString('ff_userName') ?? _userName;
    });
    _safeInit(() {
      _Ingredients = prefs
              .getStringList('ff_Ingredients')
              ?.map((x) {
                try {
                  return InfoProductStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Ingredients;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userDiet = '';
  String get userDiet => _userDiet;
  set userDiet(String value) {
    _userDiet = value;
  }

  List<String> _userAllergens = [];
  List<String> get userAllergens => _userAllergens;
  set userAllergens(List<String> value) {
    _userAllergens = value;
    prefs.setStringList('ff_userAllergens', value);
  }

  void addToUserAllergens(String value) {
    userAllergens.add(value);
    prefs.setStringList('ff_userAllergens', _userAllergens);
  }

  void removeFromUserAllergens(String value) {
    userAllergens.remove(value);
    prefs.setStringList('ff_userAllergens', _userAllergens);
  }

  void removeAtIndexFromUserAllergens(int index) {
    userAllergens.removeAt(index);
    prefs.setStringList('ff_userAllergens', _userAllergens);
  }

  void updateUserAllergensAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userAllergens[index] = updateFn(_userAllergens[index]);
    prefs.setStringList('ff_userAllergens', _userAllergens);
  }

  void insertAtIndexInUserAllergens(int index, String value) {
    userAllergens.insert(index, value);
    prefs.setStringList('ff_userAllergens', _userAllergens);
  }

  List<String> _userIngredientDislikes = [];
  List<String> get userIngredientDislikes => _userIngredientDislikes;
  set userIngredientDislikes(List<String> value) {
    _userIngredientDislikes = value;
    prefs.setStringList('ff_userIngredientDislikes', value);
  }

  void addToUserIngredientDislikes(String value) {
    userIngredientDislikes.add(value);
    prefs.setStringList('ff_userIngredientDislikes', _userIngredientDislikes);
  }

  void removeFromUserIngredientDislikes(String value) {
    userIngredientDislikes.remove(value);
    prefs.setStringList('ff_userIngredientDislikes', _userIngredientDislikes);
  }

  void removeAtIndexFromUserIngredientDislikes(int index) {
    userIngredientDislikes.removeAt(index);
    prefs.setStringList('ff_userIngredientDislikes', _userIngredientDislikes);
  }

  void updateUserIngredientDislikesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userIngredientDislikes[index] = updateFn(_userIngredientDislikes[index]);
    prefs.setStringList('ff_userIngredientDislikes', _userIngredientDislikes);
  }

  void insertAtIndexInUserIngredientDislikes(int index, String value) {
    userIngredientDislikes.insert(index, value);
    prefs.setStringList('ff_userIngredientDislikes', _userIngredientDislikes);
  }

  String _userName = 'Guest';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    prefs.setString('ff_userName', value);
  }

  List<InfoProductStruct> _Ingredients = [];
  List<InfoProductStruct> get Ingredients => _Ingredients;
  set Ingredients(List<InfoProductStruct> value) {
    _Ingredients = value;
    prefs.setStringList(
        'ff_Ingredients', value.map((x) => x.serialize()).toList());
  }

  void addToIngredients(InfoProductStruct value) {
    Ingredients.add(value);
    prefs.setStringList(
        'ff_Ingredients', _Ingredients.map((x) => x.serialize()).toList());
  }

  void removeFromIngredients(InfoProductStruct value) {
    Ingredients.remove(value);
    prefs.setStringList(
        'ff_Ingredients', _Ingredients.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromIngredients(int index) {
    Ingredients.removeAt(index);
    prefs.setStringList(
        'ff_Ingredients', _Ingredients.map((x) => x.serialize()).toList());
  }

  void updateIngredientsAtIndex(
    int index,
    InfoProductStruct Function(InfoProductStruct) updateFn,
  ) {
    Ingredients[index] = updateFn(_Ingredients[index]);
    prefs.setStringList(
        'ff_Ingredients', _Ingredients.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInIngredients(int index, InfoProductStruct value) {
    Ingredients.insert(index, value);
    prefs.setStringList(
        'ff_Ingredients', _Ingredients.map((x) => x.serialize()).toList());
  }

  String _ingredientNameLowercased = '';
  String get ingredientNameLowercased => _ingredientNameLowercased;
  set ingredientNameLowercased(String value) {
    _ingredientNameLowercased = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

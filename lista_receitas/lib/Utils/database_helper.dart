import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:lista_receitas/Models/Recipe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String recipeTable = 'recipes_table';
  String colId = 'id';
  String colName = 'name';
  String colDescription = 'description';
  String colData = 'date';

  DatabaseHelper._create();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._create();
    }

    return _databaseHelper;
  }

  void _createDataBase(Database db, int newVersion) async {
    await db.execute(
        'CREATE table $recipeTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colDescription TEXT, $colData TEXT)');
  }

  Future<Database> inicializeDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = directory.path + 'RecipesDatabase.db';

    var recipesDataBase =
        openDatabase(path, version: 1, onCreate: _createDataBase);

    return recipesDataBase;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await inicializeDataBase();
    }

    return _database;
  }

  Future<int> addRecipe(Recipe recipe) async {
    Database db = await this.database;

    var result = await db.insert(recipeTable, recipe.toMap());

    return result;
  }

  Future<List<Map<String, dynamic>>> getRecipeMapList() async {
    Database db = await this.database;

    var result = await db.query(recipeTable, orderBy: '$colId ASC');

    return result;
  }

  Future<List<Recipe>> getRecipeList() async {
    var recipesMap = await getRecipeMapList();
    int count = recipesMap.length;
    List<Recipe> recipesList = List<Recipe>();

    for (int i = 0; i < count; i++) {
      recipesList.add(Recipe.fromMapObject(recipesMap[i]));
    }

    return recipesList;
  }

  Future<int> updateRecipe(Recipe recipe) async {
    Database db = await this.database;

    var result = await db.update(recipeTable, recipe.toMap(),
        where: '$colId=?', whereArgs: [recipe.id]);

    return result;
  }

  Future<int> delRecipe(int recipeId) async {
    Database db = await this.database;

    var result =
        await db.rawDelete('DELETE FROM $recipeTable WHERE $colId=$recipeId');

    return result;
  }
}

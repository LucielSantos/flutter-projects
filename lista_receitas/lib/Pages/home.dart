import 'package:flutter/material.dart';
import 'package:lista_receitas/Models/Recipe.dart';
import 'package:lista_receitas/Pages/AddRecipe.dart';
import 'package:lista_receitas/Utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper dbHelper = DatabaseHelper();

  List<Recipe> recipesList = List<Recipe>();

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.inicializeDataBase();

    dbFuture.then((database) {
      Future<List<Recipe>> recipesListFuture = dbHelper.getRecipeList();

      recipesListFuture.then((result) {
        this.setState(() {
          this.recipesList = result;
        });
      });
    });
  }

  void onNavigateAdd() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddRecipePage(new Recipe.empty());
    })).then((result) {
      if (result == true) {
        updateListView();
      }
    });
  }

  void onNavigateEdit(Recipe editRecipe) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddRecipePage(editRecipe);
    })).then((result) {
      if (result == true) {
        updateListView();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de receitas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange[800],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[800],
        onPressed: onNavigateAdd,
        tooltip: 'Adicionar receita',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: buildRecipesListView(),
    );
  }

  void deleteRecipe(int recipeId, BuildContext context) async {
    int result = await dbHelper.delRecipe(recipeId);

    if (result != 0) {
      final snackBar = SnackBar(content: Text('Receita excluída'));
      Scaffold.of(context).showSnackBar(snackBar);

      updateListView();
    }
  }

  Widget buildRecipesListView() {
    return ListView.builder(
        itemCount: recipesList.length,
        itemBuilder: (BuildContext context, int position) {
          Recipe recipe = recipesList[position];

          return InkWell(
            onTap: () {
              onNavigateEdit(recipe);
            },
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${position + 1} -',
                          style: TextStyle(fontSize: 16),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            recipe.name,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          deleteRecipe(recipe.id, context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

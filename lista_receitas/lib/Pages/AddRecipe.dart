import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lista_receitas/Models/Recipe.dart';
import 'package:lista_receitas/Pages/home.dart';
import 'package:lista_receitas/Utils/database_helper.dart';

class AddRecipePage extends StatefulWidget {
  final Recipe recipe;

  AddRecipePage(this.recipe);

  @override
  _AddRecipePageState createState() => _AddRecipePageState(this.recipe);
}

class _AddRecipePageState extends State<AddRecipePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  DatabaseHelper dbHelper = DatabaseHelper();

  Recipe recipe;

  _AddRecipePageState(this.recipe);

  @override
  void initState() {
    if (isEdit()) {
      _nameController.text = recipe.name;
      _descriptionController.text = recipe.description;
    } else {
      resetFields();
    }

    super.initState();
  }

  void resetState() {
    _nameController.text = '';
    _descriptionController.text = '';
  }

  void resetFields() {
    _nameController.text = '';
    _descriptionController.text = '';
  }

  bool isEdit() => recipe.name != null;

  Future<bool> addRecipe() async {
    String name = _nameController.text;
    String description = _descriptionController.text;

    Recipe addRecipe = new Recipe(name, description);

    addRecipe.date = DateFormat.yMMMd().format(DateTime.now());

    int result;

    result = await dbHelper.addRecipe(addRecipe);

    Navigator.pop(context, true);
  }

  Future<bool> editRecipe() async {
    String name = _nameController.text;
    String description = _descriptionController.text;

    recipe.name = name;
    recipe.description = description;

    int result;

    result = await dbHelper.updateRecipe(recipe);

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adicionar receita',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange[800],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              resetFields();
            },
          )
        ],
      ),
      body: SingleChildScrollView(child: buildForm()),
    );
  }

  Form buildForm() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            buildTextFormField(
              control: _nameController,
              error: 'Insira o nome',
              label: 'Nome da receita',
            ),
            buildMultilineFormField(
              control: _descriptionController,
              error: 'Insira a descrição',
              label: 'Descrição da receita',
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  isEdit() ? editRecipe() : addRecipe();
                }
              },
              color: Colors.orange[800],
              child: Text(
                isEdit() ? 'Editar' : 'Adicionar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildTextFormField(
      {TextEditingController control, String error, String label}) {
    return Container(
        margin: EdgeInsets.only(bottom: 40),
        child: TextFormField(
          controller: control,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.blueGrey,
            ),
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            return value.isEmpty ? error : null;
          },
        ));
  }

  Container buildMultilineFormField(
      {TextEditingController control, String error, String label}) {
    return Container(
        margin: EdgeInsets.only(bottom: 40),
        child: TextFormField(
          controller: control,
          keyboardType: TextInputType.text,
          maxLines: 30,
          minLines: 5,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.blueGrey,
            ),
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            return value.isEmpty ? error : null;
          },
        ));
  }
}

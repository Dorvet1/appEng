import 'dart:io';
import 'dart:async';
import 'bancoDeDados.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{
  static  DataBaseHelper _dataBaseHelper;
  static Database _database;
  String engTable= 'tabela';
  String colId='id';
  String colNome='nome';
  String colValue='value';
  DataBaseHelper._createInstance();

  factory DataBaseHelper(){
    if(DataBaseHelper== null){
      _dataBaseHelper=  DataBaseHelper._createInstance();
    }
    return _dataBaseHelper;

  }
  Future<Database> get database async{
    if(_database ==null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path= directory.path + 'tabela.db';
    var tabelaDatabase = await openDatabase( path, version: 1, onCreate: _createDb );
    return tabelaDatabase;
  }
  void _createDb( Database db ,int  newVersion) async{
    await db.execute('CREATE TABLE $engTable($colId INTEGER PRIMARY KEY AUTOINCREMENTE,$colNome TEXT,'' $colValue INTEGER)');

  }
Future<int> insertBd( BancoDeDados dados) async{
  Database db = await this.database;
  var resultado = await db.insert (engTable, dados.tomap());
  return resultado;
}
//inserir resultado 
Future< BancoDeDados> getDado( int id) async{

  Database db= await this.database;
  List<Map> maps= await db.query(engTable, columns: [colId, colNome, colValue],
  where:"$colId=?",
  whereArgs: [id]);
  if(maps.length >0){
    return BancoDeDados.fromMap(maps.first);
  }
  else{
    return null;
  }
  }
  //atualizar objetos
  Future< int> updadeDados ( BancoDeDados dados) async{
    var db = await this.database;
    var resultado =
    await db.update(engTable, dados.tomap(),
    where: '$colId =?',
    whereArgs: [dados.id]);
    return resultado;
  }
}



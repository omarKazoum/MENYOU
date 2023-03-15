
abstract class Model {
  Model(this.id);
  int? id;
  String tableName = '';
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
  Model fromMap(Map<String,dynamic> map);
  Model.empty();
}

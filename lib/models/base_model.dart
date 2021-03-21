
abstract class BaseModel {
  BaseModel(this.id);
  int id;
  Map<String, dynamic> toMap();
  BaseModel fromMap(Map<String, dynamic> map);
}

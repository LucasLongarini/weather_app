abstract class BaseModel {
  BaseModel();
  static String name;
  Map<String, dynamic> toMap();
  BaseModel.fromMap(Map<String, dynamic> map);
}

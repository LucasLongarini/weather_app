abstract class BaseModel {
  static String name;
  Map<String, dynamic> toJson();
  fromJson(Map<String, dynamic> json);
}

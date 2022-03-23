import 'dart:convert';


class Users{

  List<Results> results;

  Users(this.results);

  factory Users.fromJson(Map<String, dynamic> json){

    var jsonList=json["results"] as List;

    List<Results> results=jsonList.map((map) => Results.fromJson(map)).toList();

    return Users(results);

  }


}


class Results{

  Name name;
  String email;
  Picture picture;

  Results(this.name, this.email, this.picture);

  factory Results.fromJson(Map<String, dynamic> json){
      return Results(Name.fromJson(json["name"]), json["email"] as String, Picture.fromJson(json["picture"]));

  }


}


class Name{
  String title;
  String first;
  String last;

  Name(this.title, this.first, this.last);

  factory Name.fromJson(Map<String, dynamic> json){
    return Name(json["title"] as String, json["first"] as String, json["last"] as String);
  }


}


class Picture{

  String large;
  String medium;
  String thumbnail;

  Picture(this.large, this.medium, this.thumbnail);

  factory Picture.fromJson(Map<String, dynamic> json){
    return Picture(json["large"] as String, json["medium"] as String, json["thumbnail"] as String);
  }



}
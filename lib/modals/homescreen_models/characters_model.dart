// class CharactersModelList {
//   final List<CharactersModelList> characterData;
//
//   CharactersModelList({
//     this.characterData,
//   });
//
//   factory CharactersModelList.fromJson(List<dynamic> parsedJson) {
//
//     List<CharactersModel> characterData = <CharactersModel>[];
//     characterData = parsedJson.map((i)=>CharactersModel.fromJson(i)).toList();
//
//     return CharactersModelList(
//         characterData: characterData
//     );
//   }
// }
class CharactersModelList {
  final List<CharactersModel> characterData;

  CharactersModelList({
    required this.characterData,
  });

  factory CharactersModelList.fromJson(List<dynamic> parsedJson) {

    List<CharactersModel> characterDataList = <CharactersModel>[];
    characterDataList = parsedJson.map((i)=>CharactersModel.fromJson(i)).toList();

    return CharactersModelList(
        characterData: characterDataList
    );
  }
}

class CharactersModel {
  CharactersModel({
  required  this.charId,
    required  this.name,
    required  this.birthday,
    required   this.occupation,
    required   this.img,
    required  this.status,
    required    this.nickname,
    required    this.appearance,
    required    this.portrayed,
    required    this.category,
    required    this.betterCallSaulAppearance,
  });

  final int charId;
  final String name;
  final String birthday;
  final List<dynamic> occupation;
  final String img;
  final String status;
  final String nickname;
  final List<int> appearance;
  final String portrayed;
  final String category;
  final List<int> betterCallSaulAppearance;

  factory CharactersModel.fromJson(Map<String, dynamic> json) => CharactersModel(
    charId: json["char_id"],
    name: json["name"],
    birthday: json["birthday"],
    occupation:List<String>.from(json["occupation"].map((x) => x)),
    img: json["img"],
    status: json["status"] ,
    nickname: json["nickname"],
    appearance:  List<int>.from(json["appearance"].map((x) => x)),
    portrayed: json["portrayed"],
    category: json["category"],
    betterCallSaulAppearance:  List<int>.from(json["better_call_saul_appearance"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "char_id": charId,
    "name": name,
    "birthday": birthday ,
    "occupation": occupation == null ? null : List<dynamic>.from(occupation.map((x) => x)),
    "img": img,
    "status": status ,
    "nickname": nickname,
    "appearance": appearance == null ? null : List<dynamic>.from(appearance.map((x) => x)),
    "portrayed": portrayed,
    "category": category ,
    "better_call_saul_appearance": List<dynamic>.from(betterCallSaulAppearance.map((x) => x)),
  };
}











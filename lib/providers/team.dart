import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/utils.dart';

class TeamField{
  static const createdTime = 'createdTime';
}

class Team{
  DateTime createdTime;

String teamName;
String manager;
String id;
bool isDone;


Team({
@required this.createdTime,
@required this.teamName,
@required this.manager,
this.id,
this.isDone= false ,

});

static Team fromJson(Map<String, dynamic> json) => Team(
         createdTime: Utils.toDateTime(json['createdTime']),
       teamName: json['teamName'],
        manager: json['manager'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'teamName': teamName,
        'manager': manager,
        'id': id,
        'isDone': isDone,
      
      };

}
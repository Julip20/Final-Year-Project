class User1{

final String uid;
final String displayName;
final String creationDate;
final int avatar;

User1({
  this.uid,
  this.displayName,
  this.creationDate,
  this.avatar,
});


 factory User1.fromJson(Map<String, dynamic> json){
    return User1(
      uid: json['UID'].toString(),
      displayName: json['DisplayName'].toString(),
      creationDate: json['CreationDate'].toString(),
      avatar: json['Avatar'] as int,
    );
 }

}
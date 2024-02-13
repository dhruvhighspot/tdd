class UsersResponse {
  final int? id;
  final String? name;
  final String? company;
  final String? username;
  final String? email;
  final String? address;
  final String? zip;
  final String? state;
  final String? country;
  final String? phone;
  final String? photo;

  UsersResponse({
    this.id,
    this.name,
    this.company,
    this.username,
    this.email,
    this.address,
    this.zip,
    this.state,
    this.country,
    this.phone,
    this.photo,
  });

  UsersResponse copyWith({
    int? id,
    String? name,
    String? company,
    String? username,
    String? email,
    String? address,
    String? zip,
    String? state,
    String? country,
    String? phone,
    String? photo,
  }) {
    return UsersResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      company: company ?? this.company,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      zip: zip ?? this.zip,
      state: state ?? this.state,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      photo: photo ?? this.photo,
    );
  }

  UsersResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        company = json['company'] as String?,
        username = json['username'] as String?,
        email = json['email'] as String?,
        address = json['address'] as String?,
        zip = json['zip'] as String?,
        state = json['state'] as String?,
        country = json['country'] as String?,
        phone = json['phone'] as String?,
        photo = json['photo'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'company' : company,
    'username' : username,
    'email' : email,
    'address' : address,
    'zip' : zip,
    'state' : state,
    'country' : country,
    'phone' : phone,
    'photo' : photo
  };
}
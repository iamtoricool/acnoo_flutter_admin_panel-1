class UserDataModel {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String position;
  final String status;
  bool isSelected = false;
  final String imagePath;

  UserDataModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.position,
    required this.status,
    required this.imagePath,
  });

  @override
  String toString() => 'DataModel(id: $id, username: $username, email: $email, phone: $phone, position: $position, status: $status)';
}

class AllUsers {
  static List<UserDataModel> allData = [
    UserDataModel(id: 1, username: 'Alice Johnson', email: 'alice.johnson@example.com', phone: '555-123-4567', position: 'Manager', status: 'Active', imagePath: _userProfile.$1),
    UserDataModel(id: 2, username: 'Bob Smith', email: 'bob.smith@example.com', phone: '555-234-5678', position: 'Staff', status: 'Inactive', imagePath: _userProfile.$2),
    UserDataModel(id: 3, username: 'Charlie Brown', email: 'charlie.brown@example.com', phone: '555-345-6789', position: 'Staff', status: 'Active', imagePath: _userProfile.$3),
    UserDataModel(id: 4, username: 'Diana Prince', email: 'diana.prince@example.com', phone: '555-456-7890', position: 'Manager', status: 'Active', imagePath: _userProfile.$4),
    UserDataModel(id: 5, username: 'Eve Adams', email: 'eve.adams@example.com', phone: '555-567-8901', position: 'Staff', status: 'Inactive', imagePath: _userProfile.$5),
    UserDataModel(id: 6, username: 'Frank Castle', email: 'frank.castle@example.com', phone: '555-678-9012', position: 'Manager', status: 'Active', imagePath: _userProfile.$6),
    UserDataModel(id: 7, username: 'Grace Lee', email: 'grace.lee@example.com', phone: '555-789-0123', position: 'Staff', status: 'Active', imagePath: _userProfile.$6),
    UserDataModel(id: 8, username: 'Henry Wilson', email: 'henry.wilson@example.com', phone: '555-890-1234', position: 'Staff', status: 'Inactive', imagePath: _userProfile.$7),
    UserDataModel(id: 9, username: 'Ivy Chen', email: 'ivy.chen@example.com', phone: '555-901-2345', position: 'Manager', status: 'Active', imagePath: _userProfile.$8),
    UserDataModel(id: 10, username: 'Jack Daniels', email: 'jack.daniels@example.com', phone: '555-012-3456', position: 'Staff', status: 'Active', imagePath: _userProfile.$9),
    UserDataModel(id: 11, username: 'Kathy Brown', email: 'kathy.brown@example.com', phone: '555-123-4568', position: 'Manager', status: 'Inactive', imagePath: _userProfile.$10),
    UserDataModel(id: 12, username: 'Louis Clark', email: 'louis.clark@example.com', phone: '555-234-5679', position: 'Staff', status: 'Active', imagePath: _userProfile.$1),
    UserDataModel(id: 13, username: 'Maggie Sullivan', email: 'maggie.sullivan@example.com', phone: '555-345-6780', position: 'Manager', status: 'Active', imagePath: _userProfile.$2),
    UserDataModel(id: 14, username: 'Nina Scott', email: 'nina.scott@example.com', phone: '555-456-7891', position: 'Staff', status: 'Inactive', imagePath: _userProfile.$3),
    UserDataModel(id: 15, username: 'Oliver Reed', email: 'oliver.reed@example.com', phone: '555-567-8902', position: 'Manager', status: 'Active', imagePath: _userProfile.$4),
    UserDataModel(id: 16, username: 'Paula Green', email: 'paula.green@example.com', phone: '555-678-9013', position: 'Staff', status: 'Active', imagePath: _userProfile.$5),
    UserDataModel(id: 17, username: 'Quincy Walker', email: 'quincy.walker@example.com', phone: '555-789-0124', position: 'Manager', status: 'Inactive', imagePath: _userProfile.$6),
    UserDataModel(id: 18, username: 'Rita Black', email: 'rita.black@example.com', phone: '555-890-1235', position: 'Staff', status: 'Active', imagePath: _userProfile.$7),
    UserDataModel(id: 19, username: 'Steve Harris', email: 'steve.harris@example.com', phone: '555-901-2346', position: 'Manager', status: 'Active', imagePath: _userProfile.$8),
    UserDataModel(id: 20, username: 'Tina Evans', email: 'tina.evans@example.com', phone: '555-012-3457', position: 'Staff', status: 'Inactive', imagePath: _userProfile.$9),
    UserDataModel(id: 21, username: 'Ulysses Grant', email: 'ulysses.grant@example.com', phone: '555-123-4569', position: 'Manager', status: 'Active', imagePath: _userProfile.$10),
    UserDataModel(id: 22, username: 'Vera Young', email: 'vera.young@example.com', phone: '555-234-5680', position: 'Staff', status: 'Active', imagePath: _userProfile.$1),
    UserDataModel(id: 23, username: 'Walter White', email: 'walter.white@example.com', phone: '555-345-6781', position: 'Manager', status: 'Inactive', imagePath: _userProfile.$2),
    UserDataModel(id: 24, username: 'Xena Roberts', email: 'xena.roberts@example.com', phone: '555-456-7892', position: 'Staff', status: 'Active', imagePath: _userProfile.$3),
    UserDataModel(id: 25, username: 'Yara Davis', email: 'yara.davis@example.com', phone: '555-567-8903', position: 'Manager', status: 'Active', imagePath: _userProfile.$4),
    UserDataModel(id: 26, username: 'Zachary Moore', email: 'zachary.moore@example.com', phone: '555-678-9014', position: 'Staff', status: 'Inactive', imagePath: _userProfile.$5),
    UserDataModel(id: 27, username: 'Alice Smith', email: 'alice.smith@example.com', phone: '555-789-0125', position: 'Manager', status: 'Active', imagePath: _userProfile.$6),
    UserDataModel(id: 28, username: 'Bob Johnson', email: 'bob.johnson@example.com', phone: '555-890-1236', position: 'Staff', status: 'Active', imagePath: _userProfile.$7),
    UserDataModel(id: 29, username: 'Charlie Miller', email: 'charlie.miller@example.com', phone: '555-901-2347', position: 'Manager', status: 'Inactive', imagePath: _userProfile.$8),
    UserDataModel(id: 30, username: 'Diana Scott', email: 'diana.scott@example.com', phone: '555-012-3458', position: 'Staff', status: 'Active', imagePath: _userProfile.$9),
    UserDataModel(id: 31, username: 'Eva Wilson', email: 'eva.wilson@example.com', phone: '555-123-4570', position: 'Manager', status: 'Active', imagePath: _userProfile.$10),
    UserDataModel(id: 32, username: 'Frank Harris', email: 'frank.harris@example.com', phone: '555-234-5681', position: 'Staff', status: 'Inactive', imagePath: _userProfile.$1),
    UserDataModel(id: 33, username: 'Grace Miller', email: 'grace.miller@example.com', phone: '555-345-6782', position: 'Manager', status: 'Active', imagePath: _userProfile.$2),
    UserDataModel(id: 34, username: 'Henry Davis', email: 'henry.davis@example.com', phone: '555-456-7893', position: 'Staff', status: 'Active', imagePath: _userProfile.$3),
    UserDataModel(id: 35, username: 'Ivy Martinez', email: 'ivy.martinez@example.com', phone: '555-567-8904', position: 'Manager', status: 'Inactive', imagePath: _userProfile.$3),
    UserDataModel(id: 36, username: 'Jack Lewis', email: 'jack.lewis@example.com', phone: '555-678-9015', position: 'Staff', status: 'Active', imagePath: _userProfile.$4),
    UserDataModel(id: 37, username: 'Kathy Wilson', email: 'kathy.wilson@example.com', phone: '555-789-0126', position: 'Manager', status: 'Active', imagePath: _userProfile.$5),
    UserDataModel(id: 38, username: 'Louis Green', email: 'louis.green@example.com', phone: '555-890-1237', position: 'Staff', status: 'Inactive', imagePath: _userProfile.$6),
    UserDataModel(id: 39, username: 'Maggie Clark', email: 'maggie.clark@example.com', phone: '555-901-2348', position: 'Manager', status: 'Active', imagePath: _userProfile.$7),
    UserDataModel(id: 40, username: 'Nina Johnson', email: 'nina.johnson@example.com', phone: '555-012-3459', position: 'Staff', status: 'Active', imagePath: _userProfile.$8),
    UserDataModel(id: 41, username: 'Oliver Smith', email: 'oliver.smith@example.com', phone: '555-123-4571', position: 'Manager', status: 'Inactive', imagePath: _userProfile.$9),
    UserDataModel(id: 42, username: 'Paula Brown', email: 'paula.brown@example.com', phone: '555-234-5682', position: 'Staff', status: 'Active', imagePath: _userProfile.$10),
    UserDataModel(id: 43, username: 'Quincy Adams', email: 'quincy.adams@example.com', phone: '555-345-6783', position: 'Manager', status: 'Active', imagePath: _userProfile.$1),
    UserDataModel(id: 44, username: 'Rita White', email: 'rita.white@example.com', phone: '555-456-7894', position: 'Staff', status: 'Inactive', imagePath: _userProfile.$2),
    UserDataModel(id: 45, username: 'Steve Scott', email: 'steve.scott@example.com', phone: '555-567-8905', position: 'Manager', status: 'Active', imagePath: _userProfile.$3),
    UserDataModel(id: 46, username: 'Tina Lee', email: 'tina.lee@example.com', phone: '555-678-9016', position: 'Staff', status: 'Active', imagePath: _userProfile.$4),
    UserDataModel(id: 47, username: 'Ulysses Green', email: 'ulysses.green@example.com', phone: '555-789-0127', position: 'Manager', status: 'Inactive', imagePath: _userProfile.$5),
    UserDataModel(id: 48, username: 'Vera Evans', email: 'vera.evans@example.com', phone: '555-890-1238', position: 'Staff', status: 'Active', imagePath: _userProfile.$6),
    UserDataModel(id: 49, username: 'Walter Johnson', email: 'walter.johnson@example.com', phone: '555-901-2349', position: 'Manager', status: 'Active', imagePath: _userProfile.$7),
    UserDataModel(id: 50, username: 'Xena Adams', email: 'xena.adams@example.com', phone: '555-012-3460', position: 'Staff', status: 'Inactive', imagePath: _userProfile.$8),
  ];
}

const (String, String, String, String, String, String, String, String, String, String) _userProfile = (
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_01.jpeg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_02.jpeg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_03.jpeg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_04.jpeg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_05.jpeg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_06.jpeg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_07.jpeg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_08.jpeg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_09.jpeg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_10.jpeg',
);
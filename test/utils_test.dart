import 'package:flutter_test/flutter_test.dart';
import 'package:humble/api_service.dart';
import 'package:humble/data_processer.dart';
import 'package:humble/user_model.dart';
import 'package:humble/utils.dart';
import 'package:mockito/mockito.dart';

List<User> users = [
  User(id: 1,email: 'one@gmail.com', firstName: 'First', lastName: 'Last', avatar: 'https://google.com/image.png'),
  User(id: 2,email: 'two@gmail.com', firstName: 'First', lastName: 'Last', avatar: 'https://google.com/image.png'),
];

void main(){

  test('Valid Password returns true', () {
    String pass = '123456';
    expect(Utils().isPasswordValid(pass), true);
  });


  group('email Validation', () {
    test('Valid email returns true', () {
      // Arrange & Act
      String email = 'abc@xyz.com';

      // Assert
      expect(Utils().isEmailValid(email), true);
    });

    test('Invalid Email return false', (){
      String email = 'abc';
      expect(Utils().isEmailValid(email), false);
    });
  });


 test("Testing Async code", () {
   expectLater(fetchData(), completion(equals(42)));
 });
 
//  test('Mocking API Test', (){
// // Arrange
//  final apiService = MockAPIService();
//  when(apiService.fetchData()).thenAnswer((_) async => users);
//  UserDataProcessor userDataProcessor = UserDataProcessor(apiService);
//
//  // Act
// Future<List<User>> userName =  userDataProcessor.process();
//
//    // Assert
//  expect(userName, completion('MOCKED DATA'));
//  });
}

// class MockAPIService extends Mock implements APIService {}

Future<int> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  return 42;
}

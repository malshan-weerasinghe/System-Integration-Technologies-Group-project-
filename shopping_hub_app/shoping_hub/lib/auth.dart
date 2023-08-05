import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'utils/constants.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;

  ///add your localhost url here, you need to run shopping-hub laravel backend for that
  var baseUrl = "https://349c-45-121-88-25.ngrok-free.app";

  ///our mailjet api keys valid only one month, you need to add your mailjet credential for send confirmation mails

  bool get isAuthenticated => _isAuthenticated;

  Future<bool> login(String email, String password) async {
    print('login');
    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      body: {
        'email': email,
        'password': password,
        'device_name': await getDeviceId(),
      },
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('works');
      print(response.body);

      // String token = response.body;
      // await saveToken(token);

      // String username = ''; // Retrieve the username from the response or any other source
      // await saveUsername(username);
    //var responseBodyJson = jsonDecode(response.body);
      var responseBodyJson = jsonDecode(response.body);
      print(responseBodyJson);
   /* var token = responseBodyJson['token'];
    var username = responseBodyJson['username'];

    await saveToken(token);
    await saveUsername(username);*/

      if (responseBodyJson['user']['status'] != 1) {
        Fluttertoast.showToast(msg: 'Please verify your email address');
        return false;
      }

      // Save the user's name and email
      await saveUsername(responseBodyJson['user']['name']);
      await saveEmail(responseBodyJson['user']['email']);

      _isAuthenticated = true;
      notifyListeners();
      return true;
    }

    if (response.statusCode == 422) {
      print('442');
      return false;
    }

    print('not working');
    print(response);
    return false;
  }

  Future<dynamic> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone,
      ) async {
    print('register');

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/register'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'ConfirmPassword': confirmPassword,
          'phone': phone,
          'address': 'sri lanka',
          'dob': '1999-09-19',
          'device_name': await getDeviceId(),
        },
        headers: {
          'Accept': 'application/json',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var responseBodyJson = jsonDecode(response.body);
        var token = responseBodyJson['token'];
        print(token);

        // Send OTP via Mailjet
        await sendMail(name, email, token);

       /* var responseBodyJson = jsonDecode(response.body);
        var token = responseBodyJson['token'];
        var username = responseBodyJson['username'];
        print(responseBodyJson);
        await saveToken(token);
        await saveUsername(username);*/
        _isAuthenticated = true;
        notifyListeners();
        return true;
      }

      if (response.statusCode == 409) {
        print('You are already a registered user');
        return false;
      }

      print('Registration failed');
      Fluttertoast.showToast(msg: 'Registration Success');
      return false;
    } catch (e) {
      print('Caught error: $e');
      return false;
    }
  }


  Future<String?> getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        return build.androidId;
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        return data.identifierForVendor;
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
    return null;
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('apiToken', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('apiToken');
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  Future<void> saveUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  
  }
  Future<void> saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }
  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }


  Future<void> sendMail(String name, String email, String token) async {
    var mailjetResponse = await http.post(
      Uri.parse('https://api.mailjet.com/v3.1/send'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ' + base64Encode(utf8.encode('98dd2a7f388e1851fb62388e219d12d8:f5ed5e881e381ae64dbdeb2b893dbe57')),
      },
      body: jsonEncode({
        'Messages': [
          {
            'From': {
              'Email': 'chathuraecd@gmail.com',
              'Name': 'Shopping Hub'
            },
            'To': [
              {
                'Email': email,
                'Name': name
              }
            ],
            'Subject': 'Verify Your Email Address',
            'HTMLPart': """
            <h1>Welcome to Our Service, $name!</h1>
            <p>Thank you for registering. Please verify your email address by clicking the link below:</p>
            <a href="$baseUrl/api/verify/$token">Verify Email Address</a>
            <p>If you did not request this verification, please ignore this email.</p>
            <p>Best regards,</p>
            <p>Your Name</p>
          """
          }
        ]
      }),
    );

    if (mailjetResponse.statusCode == 200) {
      print('Verification Email sent successfully, Token : $token');
    } else {
      print('Failed to send OTP');
    }
  }

  Future<void> sendOrderConfirmationMail(String email, String name, String orderId) async {
    final Uri apiUri = Uri.parse('https://api.mailjet.com/v3.1/send');

    final response = await http.post(
      apiUri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ' + base64Encode(utf8.encode('98dd2a7f388e1851fb62388e219d12d8:f5ed5e881e381ae64dbdeb2b893dbe57')),
      },
      body: jsonEncode({
        'Messages': [
          {
            'From': {
              'Email': 'chathuraecd@gmail.com',
              'Name': 'Shopping Hub'
            },
            'To': [
              {
                'Email': email,
                'Name': name,
              },
            ],
            'TextPart': 'Dear $name, thank you for your order! Your order ID is $orderId.',
            'HTMLPart': '''
            <h3>Dear $name,</h3>
            <p>Thank you for your order! Your order ID is <strong>$orderId</strong>.</p>
            <p>We are currently processing your order and will send you another email when your order is shipped.</p>
            <p>If you have any questions, please reply to this email or contact our customer service team.</p>
            <p>Thank you for shopping with us!</p>
          ''',
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      print('Order confirmation email sent successfully');
    } else {
      print('Failed to send order confirmation email: ${response.body}');
    }
  }

}





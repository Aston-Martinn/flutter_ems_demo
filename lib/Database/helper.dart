import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'ems.db');
    return await openDatabase(path, version: 1, onCreate: _createTables);
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
        CREATE TABLE user (
          id INTEGER PRIMARY KEY,
          full_name TEXT,
          email_address TEXT,
          password TEXT,
          role TEXT,
          is_logged_in INTEGER DEFAULT 0,
          is_registered INTEGER DEFAULT 0
        )
      ''');

    await db.execute('''
        CREATE TABLE leave (
          id INTEGER PRIMARY KEY,
          casual INTEGER,
          sick INTEGER,
          earned INTEGER,
          comp_off INTEGER
        )
      ''');

    await db
        .insert('leave', {'casual': 5, 'sick': 10, 'earned': 2, 'comp_off': 2});

    await db.execute('''
        CREATE TABLE leave_apply (
          id INTEGER PRIMARY KEY,
          name TEXT,
          applied_leave TEXT,
          status TEXT,
          number_of_days INTEGER,
          start_date TEXT,
          end_date TEXT
        )
      ''');

    await db.execute('''
        CREATE TABLE salary (
          id INTEGER PRIMARY KEY,
          total REAL,
          basic REAL,
          epf REAL,
          tax REAL,
          daily_allowance REAL,
          medical_allowance REAL
        )
      ''');
  }

  Future<Map<String, dynamic>?> getUserDetails(int userId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result =
        await db.query('user', where: 'id = ?', whereArgs: [userId], limit: 1);

    return result.isNotEmpty ? result.first : null;
  }

  Future<int> insertUser(
      String fullName, String email, String password, String role) async {
    Database db = await instance.database;
    return await db.insert('user', {
      'full_name': fullName,
      'email_address': email,
      'password': password,
      'role': role,
      'is_registered': 1,
      'is_logged_in': 0,
    });
  }

  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      'user',
      where: 'email_address = ? AND password = ?',
      whereArgs: [email, password],
      limit: 1,
    );

    if (result.isNotEmpty) {
      await db.update(
        'user',
        {'is_logged_in': 1},
        where: 'email_address = ? AND password = ?',
        whereArgs: [email, password],
      );

      return result.first;
    } else {
      return null; // User not found or credentials are invalid
    }
  }

  Future<Map<String, int>> getLeaveCounts() async {
    Database db = await instance.database;

    List<Map<String, dynamic>> result = await db.query('leave');

    if (result.isNotEmpty) {
      return {
        'sick': result[0]['sick'],
        'casual': result[0]['casual'],
        'earned': result[0]['earned'],
        'compOff': result[0]['comp_off'],
      };
    } else {
      return {
        'sick': 0,
        'casual': 0,
        'earned': 0,
        'compOff': 0,
      };
    }
  }

  Future<Map<String, dynamic>?> getLastAppliedLeaveApplication() async {
    Database db = await instance.database;

    List<Map<String, dynamic>> result = await db.query(
      'leave_apply',
      orderBy: 'id DESC',
      where: 'status = ?',
      whereArgs: ['applied'],
      limit: 1,
    );

    return result.isNotEmpty ? result.first : null;
  }

  Future<List<Map<String, dynamic>>> getAllLeaveApplications() async {
    Database db = await instance.database;

    List<Map<String, dynamic>> result = await db.query(
      'leave_apply',
      where: 'status = ?',
      whereArgs: ['applied'],
      orderBy: 'id DESC',
    );

    return result;
  }

  Future<int> insertLeaveApplication(Map<String, dynamic> row) async {
    final db = await instance.database;

    return await db.insert('leave_apply', row);
  }

  Future<void> updateLeaveStatus(int id, String status) async {
    Database db = await instance.database;
    await db.update(
      'leave_apply',
      {'status': status},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, dynamic>> getLeaveType(String appliedLeave) async {
    try {
      Database db = await instance.database;

      List<Map<String, dynamic>> result = await db.query(
        'leave',
        columns: [appliedLeave],
      );

      if (result.isNotEmpty) {
        return result.first;
      } else {
        print('No leave type data found for $appliedLeave');
        return {}; // Return an empty map or handle appropriately
      }
    } catch (e) {
      print('Error fetching leave type data: $e');
      return {}; // Return an empty map or handle appropriately
    }
  }

  Future<void> adjustLeaveTypeCount(String leaveType, int days) async {
    Database db = await instance.database;
    await db.rawUpdate('''
      UPDATE leave 
      SET ${leaveType} = ${leaveType} - ?
    ''', [days]);
  }

  Future<String> getName() async {
    try {
      Database db = await instance.database;

      List<Map<String, dynamic>> result = await db.query(
        'user',
        columns: ['full_name'],
      );

      if (result.isNotEmpty) {
        return result.first['full_name'];
      } else {
        return '';
      }
    } catch (e) {
      print('Error fetching name: $e');
      return '';
    }
  }

  Future<Map<String, String>> getUserNameEmail() async {
    try {
      Database db = await instance.database;

      List<Map<String, dynamic>> result = await db.query(
        'user',
        columns: ['full_name', 'email_address'],
      );

      if (result.isNotEmpty) {
        return {
          'full_name': result.first['full_name'] ?? '',
          'email_address': result.first['email_address'] ?? '',
        };
      } else {
        return {
          'full_name': '',
          'email_address': '',
        };
      }
    } catch (e) {
      print('Error fetching user details: $e');
      return {
        'full_name': '',
        'email': '',
      };
    }
  }
}

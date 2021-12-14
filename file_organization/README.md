# File Organization
    Beginer Level App to learn how Flutter handles File 
        and learnig some functionality of path_finder package
        also converting json to string and string to json
        
    
    


### App Interface
   ![ScreenShot](https://github.com/shreyasSarve/FlutterBeginer/blob/master/images/fileorganization/Screenshot%20from%202021-12-13%2015-53-36.png)
   

## Lessons Learned

   - Including library in Flutter app
   - Future async,and await
   - Reading and wrting Text/JSON data into local file
   - Converting JSON
      - json.encode
      - json.decode

 ### Working with JSON
   import build in library  `dart:convert`
 ```dart
    Map<String,dynamic> _mydata;
    json.encode(_myData); // for serialization
    
    _myData = json.decode(_myData); //  for deserialization
 ```


 ## SharedPreferences
   **I have not used SharedPreferences here**
    
  >How to use SharedPreferences 
  - add shared_preferences package [Click Here](https://pub.dev/packages/shared_preferences)

   then getInstance

   ```dart
   SharedPreferences _prefs = await SharedPreferences.getInstance();
   ```
   *to writeData you need two things* `_key` and `_data`

   ```dart
          _prefs.setString(_keyString,_dataString); // String
          _prefs.setInt(_keyInt,_dataInt);         // int
          _prefs.setDouble(_keyDouble,_dataDouble); //double
          _prefs.setBool(_keyBool,_databool);      //boolean
          _prefs.setStringList(_keyStringList,_dataStringList); //List<String>
   ```
 *to readData you only need is* `_key`
  ```dart
  String _stringData = _prefs.getString(_keyString); //String
   int _intData = _prefs.getInt(_keyInt);             //Int
   double _doubleData = _prefs.getDoble(_keyDouble); //Double
   bool  _boolData = _prefs.getBool(_keyBool); //Boolean
   List<String> _stringList = _prefs.getStringLsit(_keyStringList);           //List<String>
```

 :warning: **Always check for Null values**
 
 > for more info visit [pub.dev](https://pub.dev/packages/shared_preferences)


:dart: Happy Coding :smiley:

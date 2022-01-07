# **Flutter & API 's**
 In this project I tried working with apis as name suggest :smiley: worked on 
 - Fetching Data
 - Fetching Particular Node
 - Pushing Data
 - Modifying Data
 - Deleting Data
 
For this I used [Swagger UI](https://tq-notes-api-jkrgrdggbq-el.a.run.app/swagger/index.html)   <-- very simple and very easy to use has every basic method that we learn during Rest API 

## App Interface 
![Interface Gif](https://github.com/shreyasSarve/FlutterBeginer/blob/master/appsData/flutterAndApis/flutterAndApiS.gif)

<br>

| Parameter | Type     | Description                 |
| :-------- | :------- | :-------------------------: |
| `api_key` | `string` | **Required**. Your API key  |
|`Content-Type`|`string`|**Required** for post/put   |

<br>

 ## Fetching Data
 


<br>

   ### whole list =>
  ```dart
  Map<String,dynamic> _header={
      'apiKey':_apiKey
  };
    string url="https://tq-notes-api-jkrgrdggbq-el.a.run.app/";
  http.get(Uri.parse(url),header:_header);
  ```

  <br>

  ### single node =>
   ```dart
      http.get(Uri.parse(url+nodeId),header:_header);
 ```
<br>
 
## Pushing Data 

heare header changes some what we need to tell server what kind of data we are asking him to store <br>

in this case we are using json so we will use
     **Content-Type : 'application/json'**
```dart
 Map<String,dynamic> _header={
      'apiKey':_apiKey,
      'Content-Type':'application/json'
  };
  
  http.post(Uri.parse(url),header:_header,body:json.encode(item.toMap));           
                 // toMap function will convert  data to Map
                  // its user defined function
```
<br>
 
## Putting Data
this part is same as Pushing Data just we need to change 
**url** to **utl+nodeId**
 ```dart
   http.put(Uri.parse(url+nodeId),header:_header,bode:json.encode(item.toMap));
 ```
 <br>

 ## Deleting Node
     
 ```dart
  http.delete(uri.parse(url+nodeId),header:_header);
```

<br>
:warning: I didnt added await async or then method here for more feel free to open code

:dart: Happy Coding :smiley:


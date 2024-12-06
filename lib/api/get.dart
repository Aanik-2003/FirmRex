

// class GetApi {
//   // function
//   Future<NewsApi?>getNewsApiCall() async{
//     try{
//       var url =
//       Uri.https(StaticValue.baseURL, '/v2/everything', {'q': 'tesla','apikey': StaticValue.apiKey});
//
//       // Await the http get response, then decode the json-formatted response.
//       var response = await http.get(url,
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Cache-Control': 'no-cache,private,no-store,must-revalidate'
//           });
//       if (response.statusCode.toString().contains("20")){
//         var jsonData = json.decode(response.body);
//         NewsApi newsdata = NewsApi.fromJson(jsonData);
//         return newsdata;
//       }else{
//         return null;
//       }
//     }catch(e) {
//
//       return null;
//     }
//   }
// }
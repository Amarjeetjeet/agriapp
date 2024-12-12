// import 'dart:convert';
//
// import 'package:crypto/crypto.dart';
// import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart'
//     show PayUHashConstantsKeys;
//
// class HashService {
//   static const merchantSalt = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC3jmodgIIp9JpK9ZPiPLus4JlKVIQvm6HRIG6sp8Qmdsw2gGhnaT5vuOcdfDGzvJgDTJzTh0IlL14+s2nVBSmhKl0XwiyQsRx6mVDx8fqPBeJqF9oXMrU5PZ7v7bm/wdBNYzwXcWXtc07iR86Fcpf4yZmJ5kKrpqBuDGhGauGZlzyNeIWBHQqgyPGsK0jbYYqu0KrlcB30MzmQJl2PoFPzQThAMuRenWj4he9W4F5OmsaeGz+Wm3UtWEmZ8M0rSFgT6VKWp7ffmNpAGi0FS7TCd4I9M7c5Zn6vCi/qVWBPzBSjq77OnwtGNJ1plJ8WH0sgWIidjhOu0oJhsCbS7vivAgMBAAECggEAKRlYJTbq7h34liQacqOKmhDIAd6eolJEjyCl5z7BKqOa4fEqb00fT8Ck7vMp5caqesKisrIsW0sZ3Qwq/CllwtJLedBeTh958vF1MFcv9OoqYfrpOByAe0qS1cHyvz7UNx+rCsy3N82DsiLF2Rdpc6kgGcJW1zw926YniuzPiqXzLcP6KVAveYu/+o6SIt8govMNpn4WAsSSYccJgqgMnEl+DyorZf7ZnZLcYgmg/4xoDrWjvxQGgKaRyB1FensR+NrZc0ZJlN6pOav2YcuIZ4OvPucD1sjC4SUt21tAE7+HoQp0SieZVc7mPflNAKtf9QbqUa9KmNC/rqDfWyADsQKBgQDdrUe+rUMoG1IfC09thuYR0JTYJga7rUcxmTm5AAKZS1LZxal+8PLqbfL9WehadJOuwQNHcjh3OqtYiahUJ2B0yEk2V+snxMwHIp9OHX0A3dZ/VTLAvAuNc/hUCw1wHGARZ2VcuxcToAOsuS5C4gfSGzziv6mh6tPbpLfHYQhVvQKBgQDT+iE3XY/4eQ5mfmlCsFR4zAaRcD9CyjWHGoYkwhytfvdvUeJKUI/g9pcZHvP8A/Flwdk55n4uDT6JdViHrI/86D1clUW97p9/rvUYYFMc7v1+75IZYoNaSoaWvhRpx+SKC/vC9bNhqQxWhcUtunPstrD17sB3WK3wMilcaM4g2wKBgAF1NUaUvx9RZq3bli8jNvohBAmT3nF3h0NVPaLw1BOMAkR6X039aauPA40U/UkzARGiJVJf9u0ZzqyrYxcCl0jNVGXuGBbP3YOif6e02/CYhOObfNT1p6HLhHORCwqUtTEIHAuLE3DGmZ+WLC62a9S+5xyapBPzhmcoYykFg1eFAoGAKq3CwE3zLbjZ4GL1OHseFtAlRmUOJ5lk25XIimAWvAvDL8ORxxqfTVD4rRMhVo1Irg8weEri/syl2bEpqO9ici4kJJ7dUtdXf7KvIEBMm5e2rDb5+GhwP96faHxOydl4Nx8gimlDu5b4p/b48zMGIhPKX0m5sI3HP4Qp9bQYRF8CgYEAtwe6/Ef5R/wxpPoNwxuqLQgZaSDTqUSwgPwTnOGteHHJeVcLL5vZzrZrX8FdkTw5PoFfKOFh4w6UJr8ixHFYhNWPmZDnXuHQyy25yxyU/AUbbin7Tyd0Vvl8fieaxKzcb7MJ7qR7KNnqzfpyU83mxeSe1pwnsbhZDI2T+ak1apY="; // Add you Salt here.
//   static const merchantSecretKey = ""; // Add Merchant Secrete Key - Optional
//   static Map generateHash(Map response) {
//     var hashName = response[PayUHashConstantsKeys.hashName];
//     var hashStringWithoutSalt = response[PayUHashConstantsKeys.hashString];
//     var hashType = response[PayUHashConstantsKeys.hashType];
//     var postSalt = response[PayUHashConstantsKeys.postSalt];
//     var hash = "";
//     if (hashType == PayUHashConstantsKeys.hashVersionV2) {
//       hash = getHmacSHA256Hash(hashStringWithoutSalt, merchantSalt);
//     } else if (hashName == PayUHashConstantsKeys.mcpLookup) {
//       hash = getHmacSHA1Hash(hashStringWithoutSalt, merchantSecretKey);
//     } else {
//       var hashDataWithSalt = hashStringWithoutSalt + merchantSalt;
//       if (postSalt != null) {
//         hashDataWithSalt = hashDataWithSalt + postSalt;
//       }
//       hash = getSHA512Hash(hashDataWithSalt);
//     }
//     var finalHash = {hashName: hash};
//     return finalHash;
//   }
//
//   static String getSHA512Hash(String hashData) {
//     var bytes = utf8.encode(hashData);
//     var hash = sha512.convert(bytes);
//     return hash.toString();
//   }
//
//   static String getHmacSHA256Hash(String hashData, String salt) {
//     var key = utf8.encode(salt);
//     var bytes = utf8.encode(hashData);
//     final hmacSha256 = Hmac(sha256, key).convert(bytes).bytes;
//     final hmacBase64 = base64Encode(hmacSha256);
//     return hmacBase64;
//   }
//
//   static String getHmacSHA1Hash(String hashData, String salt) {
//     var key = utf8.encode(salt);
//     var bytes = utf8.encode(hashData);
//     var hmacSha1 = Hmac(sha1, key); // HMAC-SHA1
//     var hash = hmacSha1.convert(bytes);
//     return hash.toString();
//   }
// }

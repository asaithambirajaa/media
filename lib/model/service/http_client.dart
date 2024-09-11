import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';

class SSLPinning {
  // Store your public key's SHA-256 hash
  static const String _publicKeyHash =
      'YOUR_PUBLIC_KEY_HASH'; // Replace with your public key hash

  // Create a custom HttpClient with SSL Pinning
  static Future<HttpClient> createHttpClient() async {
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        // Extract the certificate's public key and hash it
        final publicKey = cert.pemPublicKey();
        final publicKeySha256 =
            sha256.convert(utf8.encode(publicKey)).toString();

        // Compare the hash with the pinned hash
        return publicKeySha256 == _publicKeyHash;
      };

    return httpClient;
  }

  // Helper function to make a request with SSL Pinning
  static Future<HttpClientResponse> makeRequest(String url) async {
    final httpClient = await createHttpClient();
    final uri = Uri.parse(url);
    final request = await httpClient.getUrl(uri);
    final response = await request.close();
    return response;
    // if (response.statusCode == 200) {
    //   final responseBody = await response.transform(utf8.decoder).join();
    //   return responseBody;
    // } else {
    //   throw HttpException('Failed to load data: ${response.statusCode}');
    // }
  }
}

// Helper extension method to extract the public key from the certificate
extension X509CertificatePublicKey on X509Certificate {
  String pemPublicKey() {
    // This is a simplified way to extract the public key from the certificate's PEM format
    final pem =
        '''-----BEGIN CERTIFICATE-----\n${this.pemEncoded()}\n-----END CERTIFICATE-----''';
    // Extract the public key in a simplified manner
    final publicKeyRegex = RegExp(
        r'-----BEGIN PUBLIC KEY-----(.*?)-----END PUBLIC KEY-----',
        dotAll: true);
    final match = publicKeyRegex.firstMatch(pem);
    if (match != null) {
      return match.group(1)!.trim();
    } else {
      return ''; // Return empty string if not found
    }
  }

  String pemEncoded() {
    return base64.encode(utf8.encode(toString()));
  }
}

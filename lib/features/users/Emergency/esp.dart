import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class SendESP extends StatelessWidget {
  SendESP({super.key, required this.location});
  final LatLng location;
  final String esp8266Hostname = 'http://esp8266.local'; // Use mDNS name

  void sendMessageToESP(BuildContext context, String message) async {
    try {
      var url = Uri.parse('$esp8266Hostname');
      var response = await http.post(url, body: message);

      if (response.statusCode == 200) {
        // Show success message in Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Message sent successfully: $message'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Show failure message in Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Failed to send message. Status code: ${response.statusCode}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Show error message in Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error sending message: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 39, 39, 39)),
        onPressed: () => sendMessageToESP(
          context,
          '/6969/${location.latitude},${location.longitude}/6969/',
        ),
        child: Text(
          'Send SOS',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
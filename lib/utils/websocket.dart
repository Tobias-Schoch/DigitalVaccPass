import 'dart:io';
import 'package:udp/udp.dart';

class receiver {
  main() async {
    var receiver = await UDP.bind(Endpoint.loopback(port: Port(65002)));
    print(receiver);
    print(Endpoint.loopback(port: Port(65002)));
    stdout.write(receiver);
    stdout.write(Endpoint.loopback(port: Port(65002)));
    await receiver.listen((datagram) {
      var str = String.fromCharCodes(datagram.data);
      stdout.write(str);
    }, timeout: Duration(seconds: 20));

    receiver.close();
  }
}

class sender {
  main() async {
    var sender = await UDP.bind(Endpoint.any(port: Port(65002)));
    var dataLength = await sender.send(
        "Hello World!".codeUnits, Endpoint.broadcast(port: Port(65002)));

    stdout.write("${dataLength} bytes sent.");

    sender.close();
  }
}


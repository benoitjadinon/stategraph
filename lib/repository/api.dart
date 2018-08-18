typedef Response HttpSend(Request request);

class ApiState {
  final HttpSend send;
  final String token;
  const ApiState(this.send, this.token);
}

Response send(Request request) {
  // Authentication Set

  // Send request over http

  // Return response - Example
  return Response("error", 404);
}

class Request {
  final String url;
  final String token;
  const Request(this.url, this.token);
}

class Response {
  final String data;  
  final int code;
  const Response(this.data, this.code);
}

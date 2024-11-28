@isTest
global class AnimalLocatorErrorMock implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setStatusCode(500);
        response.setBody('{"error":"Internal Server Error"}');
        return response;
    }
}
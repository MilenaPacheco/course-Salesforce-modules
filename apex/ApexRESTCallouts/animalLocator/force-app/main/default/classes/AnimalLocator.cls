public class AnimalLocator {
    public static String getAnimalNameById(Integer id) {
        if (id == null || id <= 0) {
            throw new IllegalArgumentException('El ID debe ser un número entero positivo.');
        }

        // URL del endpoint
        String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals/' + id;

        // Configuración de la solicitud HTTP
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        // Enviar la solicitud
        HttpResponse response = http.send(request);

        // Validar la respuesta
        if (response.getStatusCode() == 200) {
        Map<String, Object> responseBody = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        Map<String, Object> animal = (Map<String, Object>) responseBody.get('animal'); // Accede al objeto "animal"
        return (String) animal.get('name'); // Extrae animal"
    }
 	else {
            throw new CalloutException('Error en la llamada REST: ' + response.getStatusCode());
        }
    }
}
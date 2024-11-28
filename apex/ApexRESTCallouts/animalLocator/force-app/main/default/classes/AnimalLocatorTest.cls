@isTest
private class AnimalLocatorTest {
    @isTest
    static void testGetAnimalNameByIdSuccess() {
        // Configurar el simulador para una respuesta exitosa
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        // Llamar al método con un ID válido
        String animalName = AnimalLocator.getAnimalNameById(1);
        System.assertEquals('chicken', animalName, 'El nombre del animal debe ser chicken');
    }

    @isTest
    static void testGetAnimalNameByIdInvalidId() {
        // Probar con un ID negativo
        try {
            AnimalLocator.getAnimalNameById(-1);
            System.assert(false, 'Se esperaba una excepción para un ID negativo.');
        } catch (IllegalArgumentException e) {
            System.assertEquals('El ID debe ser un número entero positivo.', e.getMessage());
        }

        // Probar con un ID nulo
        try {
            AnimalLocator.getAnimalNameById(null);
            System.assert(false, 'Se esperaba una excepción para un ID nulo.');
        } catch (IllegalArgumentException e) {
            System.assertEquals('El ID debe ser un número entero positivo.', e.getMessage());
        }
    }

    @isTest
    static void testGetAnimalNameByIdErrorResponse() {
        // Configurar el simulador para una respuesta con error
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorErrorMock());

        // Probar cuando el endpoint devuelve un error
        try {
            AnimalLocator.getAnimalNameById(1);
            System.assert(false, 'Se esperaba una excepción para un estado de respuesta diferente a 200.');
        } catch (CalloutException e) {
            System.assert(e.getMessage().startsWith('Error en la llamada REST'), 'La excepción debe indicar un error en la llamada REST.');
        }
    }


    @isTest
    static void animalLocatorTest() {
        // Configurar el simulador
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String actual = AnimalLocator.getAnimalNameById(1);
        String expected = 'chicken';
        System.assertEquals(actual, expected);
    }

}
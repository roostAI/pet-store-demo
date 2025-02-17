// Test generated by RoostGPT for test petstore-java using AI Type Open AI and AI Model gpt-4

package hello.model;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class Pet_Pet_41e572ac4b_Test {

    private Pet pet;

    @BeforeEach
    public void setUp() {
        pet = new Pet("Tommy");
    }

    @Test
    public void testPetName() {
        assertEquals("Tommy", pet.getName());
    }

    @Test
    public void testPetNameWithNull() {
        assertThrows(NullPointerException.class, () -> new Pet(null));
    }

}

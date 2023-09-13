// Test generated by RoostGPT for test petstore-java using AI Type Open AI and AI Model gpt-4

package hello.model;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class Pet_getName_8400ac6fb7_Test {

    private Pet pet;

    @BeforeEach
    public void setUp() {
        pet = new Pet();
    }

    @Test
    public void testGetName_WhenNameIsSet() {
        String expectedName = "Fluffy";
        pet.setName(expectedName);
        String actualName = pet.getName();
        assertEquals(expectedName, actualName, "The name returned by getName() should match the name set.");
    }

    @Test
    public void testGetName_WhenNameIsNotSet() {
        String expectedName = null;
        String actualName = pet.getName();
        assertEquals(expectedName, actualName, "The name returned by getName() should be null if no name was set.");
    }
}
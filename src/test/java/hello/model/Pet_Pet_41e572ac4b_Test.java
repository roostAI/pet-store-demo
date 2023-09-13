package hello.model;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class Pet_Pet_41e572ac4b_Test {

    private Pet pet;

    @BeforeEach
    public void setUp() {
        pet = new Pet();
        // Assuming the Pet class has a setName method
        pet.setName("Tommy");
    }

    @Test
    public void testPetName() {
        assertEquals("Tommy", pet.getName());
    }

    @Test
    public void testPetNameWithNull() {
        assertThrows(NullPointerException.class, () -> {
            Pet pet = new Pet();
            pet.setName(null);
        });
    }

    @Test
    public void testPetNameNotNull() {
        assertNotNull(pet.getName());
    }

}

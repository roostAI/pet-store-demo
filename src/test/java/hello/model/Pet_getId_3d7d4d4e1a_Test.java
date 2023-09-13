package hello.model;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

@ExtendWith(MockitoExtension.class)
public class Pet_getId_3d7d4d4e1a_Test {

    private Pet pet;

    @Test
    public void testGetId_Success() {
        pet = new Pet();
        long expectedId = 100L;
        // assuming Pet class has a method setId
        pet.setId(expectedId);
        long actualId = pet.getId();
        assertEquals(expectedId, actualId, "The expected ID does not match the actual ID");
    }

    @Test
    public void testGetId_Failure() {
        pet = new Pet();
        long unexpectedId = 101L;
        long actualId = pet.getId();
        assertNotEquals(unexpectedId, actualId, "The unexpected ID should not match the actual ID");
    }
}

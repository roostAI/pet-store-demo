// Test generated by RoostGPT for test petstore-java using AI Type Open AI and AI Model gpt-4

package hello.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Column;
import jakarta.validation.constraints.NotNull;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

@Entity
@Table(name = "pets")
public class Pet {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    @NotNull
    private long id;

    public long getId() {
        return id;
    }
}

class Pet_getId_3d7d4d4e1a_Test {

    private Pet pet;

    @BeforeEach
    public void setUp() {
        pet = Mockito.mock(Pet.class);
    }

    @Test
    public void testGetIdSuccess() {
        Mockito.when(pet.getId()).thenReturn(1L);

        long expectedId = 1L;
        long actualId = pet.getId();

        Assertions.assertEquals(expectedId, actualId, "Pet ID should be 1");
    }

    @Test
    public void testGetIdFailure() {
        Mockito.when(pet.getId()).thenReturn(2L);

        long unexpectedId = 1L;
        long actualId = pet.getId();

        Assertions.assertNotEquals(unexpectedId, actualId, "Pet ID should not be 1");
    }
}
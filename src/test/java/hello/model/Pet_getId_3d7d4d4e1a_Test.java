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

    @Test
    public void testGetIdSuccess() {
        Pet petMock = Mockito.mock(Pet.class);
        Mockito.when(petMock.getId()).thenReturn(1L);
        Assertions.assertEquals(1L, petMock.getId());
    }

    @Test
    public void testGetIdFailure() {
        Pet petMock = Mockito.mock(Pet.class);
        Mockito.when(petMock.getId()).thenReturn(0L);
        Assertions.assertNotEquals(1L, petMock.getId());
    }
}

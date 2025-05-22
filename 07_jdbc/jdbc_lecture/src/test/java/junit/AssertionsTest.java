package junit;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class AssertionsTest {

    // 두 값이 동일한지 확인
    @Test
    void assertTests(){
        // 두 값이 동일한지 확인
        //assertEquals(4, 2*2, "곱셈결과 확인");

        // 조건식이 true인지 확인
        //assertTrue(5==1, "조건이 맞느지 확인");

        // assertNotNull(new Object(), "객체가 null이 아님을 확인");

        // 특정 예외가 발생하는지 확인
        Exception exception = assertThrows(ArithmeticException.class, () -> {
            int result = 1/0;
        });

        // 예외 메세지 확인
        assertEquals("/ by zero", exception.getMessage());
    }
}

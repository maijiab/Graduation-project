import org.junit.Test;

import java.util.UUID;

/**
 * Created by fyl1997 on 2017/12/7.
 */
public class UUIDTest {
    @Test
    public void testUuid(){
    String code= UUID.randomUUID().toString();
    code=code.replace("-","");
        System.out.println(code);
    }
}

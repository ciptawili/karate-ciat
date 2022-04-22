package api;

//import com.intuit.karate.junit5.Karate;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions(
        features = "classpath:api", tags = "~@ignore"
)
public class ExampleTest {

}

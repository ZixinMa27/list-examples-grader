import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }
  
  @Test 
	public void testList() {
    List<String> input = new ArrayList<>();
    input.add("moon");
    input.add("b");
    input.add("c");
    StringChecker sc = new IsMoon();
    List<String> output = new ArrayList<>();
    output.add("moon");
    assertArrayEquals(output.toArray(), ListExamples.filter(input, sc).toArray());
	}


}


